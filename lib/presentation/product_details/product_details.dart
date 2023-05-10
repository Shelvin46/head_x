// ignore_for_file: use_build_context_synchronously

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/countof_cart/countof_cart_bloc.dart';
import 'package:head_x/application/indicator_bloc/indicator_bloc_bloc.dart';
import 'package:head_x/application/product_list/product_list_bloc.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/core/uiConstant.dart';
import 'package:head_x/firebase/cart/cart_opreation.dart';
// import 'package:head_x/firebase/wishlist/wishlist_opreation.dart';
import 'package:head_x/main.dart';
import 'package:head_x/presentation/categories/wireless_category/main_wireless.dart';
// import 'package:head_x/presentation/order_details/order_summary.dart';
import 'package:head_x/presentation/product_details/widgets/specifications.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../application/cart_showing/cart_showing_bloc.dart';
import '../wishlist/widgets/favourite_icon.dart';


int length = 0;
int countOfProduct = 1;

class MainProductDetails extends StatelessWidget {
  const MainProductDetails({
    super.key,
    required this.id,
    required this.index,
  });
  final int index;
  final String id;

  @override
  Widget build(BuildContext context) {
    // log
    return Scaffold(
      bottomSheet: BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
          final data = state.productList[index];
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            key: UniqueKey(),
            children: [
              InkWell(
                onTap: () async {

                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      barrierDismissible: false);
                  await CartOperation()
                      .cartAdding(data, userId, context, countOfProduct);
                  BlocProvider.of<CartShowingBloc>(context).add(CartgShowing());
                  BlocProvider.of<CountofCartBloc>(context)
                      .add(InitializeCount());
                  Navigator.pop(context);
                },
                child: Container(
                  width: myMediaQueryData.size.width * 0.5,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                      )),
                  child: const Center(
                      child: Text(
                    "Add to cart",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: myMediaQueryData.size.width * 0.5,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: const Center(
                      child: Text(
                    "Buy Now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  )),
                ),
              )
            ],
          );
        },
      ),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(
            title: "Product Details",
            appbarColor: orderDetails,
          )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: myMediaQueryData.size.width * 1,
          height: myMediaQueryData.size.height * 1.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: myMediaQueryData.size.height * 0.750,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    productGap1,
                    FavouriteIcon(
                      index: index,
                      userId: userId,
                      idOfAllproduct: id,
                    ),
                    BlocBuilder<ProductListBloc, ProductListState>(
                      builder: (context, state) {
                        length = state.productList[index]['images'].length;
                        return SizedBox(
                          width: double.infinity,
                          height: myMediaQueryData.size.height * 0.5,
                          child: CarouselSlider.builder(
                            itemCount:
                                state.productList[index]['images'].length,
                            itemBuilder: (context, indexofEach, realIndex) {
                              final images = state.productList[index]['images']
                                  [indexofEach];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: NetworkImage(images),
                                    fit: BoxFit.fill,
                                  )),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              pageSnapping: false,
                              enableInfiniteScroll: false,
                              height: 350,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                BlocProvider.of<IndicatorBlocBloc>(context)
                                    .add(ChangingIndex(index: index));
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    Center(child: buildIndicator()),
                    SizedBox(
                      height: 100,
                      child: BlocBuilder<ProductListBloc, ProductListState>(
                        builder: (context, state) {
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, indexofEach) {
                              final value = state.productList[index]['images']
                                  [indexofEach];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 90,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(value),
                                          fit: BoxFit.fill)),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Padding(
                                  padding: EdgeInsets.all(8.0));
                            },
                            itemCount:
                                state.productList[index]['images'].length,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              productGap2,
              BlocBuilder<ProductListBloc, ProductListState>(
                builder: (context, state) {
                  final values = state.productList[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: myMediaQueryData.size.width * 0.02),
                        child: Text(
                          values['name'],
                          style: productTitileStyle,
                          maxLines: 2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: myMediaQueryData.size.width * 0.02),
                        child: Text.rich(
                          TextSpan(
                            text: '\u20B9',
                            style: const TextStyle(
                                fontSize: 24, color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${values['price']}',
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: myMediaQueryData.size.width * 0.02),
                child: Text(
                  "Available Colors",
                  style: productPriceStyle,
                ),
              ),
              // SizedBox(
              //   height: 100,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 10),
              //     child: ListView.separated(
              //         scrollDirection: Axis.horizontal,
              //         itemBuilder: (context, index) {
              //           return Column(
              //             children: [
              //               Expanded(
              //                 child: Container(
              //                   width: 50,
              //                   height: 100,
              //                   color: Colors.red,
              //                 ),
              //               ),
              //               const SizedBox(
              //                 height: 5,
              //               ),
              //               const Text("Red")
              //             ],
              //           );
              //         },
              //         separatorBuilder: (context, index) {
              //           return const Padding(padding: EdgeInsets.all(8.0));
              //         },
              //         itemCount: 4),
              //   ),
              // ),
              productGap2,
              Padding(
                padding:
                    EdgeInsets.only(left: myMediaQueryData.size.width * 0.02),
                child: Text("Specifications", style: productPriceStyle),
              ),
              BlocBuilder<ProductListBloc, ProductListState>(
                builder: (context, state) {
                  final value = state.productList[index];
                  return Column(
                    children: [
                      productGap2,
                      ProductSpecification(
                        color: specColor,
                        text1: "Color:",
                        text2: value['color'],
                      ),
                      productGap2,
                      ProductSpecification(
                        color: specColor,
                        text1: "Length:",
                        text2: value['lenght'].toString(),
                      ),
                      productGap2,
                      ProductSpecification(
                        color: specColor,
                        text1: "Description:",
                        text2: value['description'],
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIndicator() {
    return BlocBuilder<IndicatorBlocBloc, IndicatorBlocState>(
      builder: (context, state) {
        return AnimatedSmoothIndicator(
            activeIndex: state.activeIndex, count: length);
      },
    );
  }
}
