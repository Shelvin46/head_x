// ignore_for_file: use_build_context_synchronously

// import 'dart:math';

import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/address_showing/address_showing_bloc.dart';
// import 'package:head_x/application/address_showing/address_showing_bloc.dart';
import 'package:head_x/application/countof_cart/countof_cart_bloc.dart';
import 'package:head_x/application/indicator_bloc/indicator_bloc_bloc.dart';
// import 'package:head_x/application/order_summary/order_summary_bloc.dart';
import 'package:head_x/application/product_list/product_list_bloc.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/core/uiConstant.dart';
// import 'package:head_x/firebase/address/add_address.dart';
import 'package:head_x/firebase/cart/cart_opreation.dart';
// import 'package:head_x/firebase/wishlist/wishlist_opreation.dart';
import 'package:head_x/main.dart';
// import 'package:head_x/presentation/categories/wireless_category/main_wireless.dart';
import 'package:head_x/presentation/home/main_home.dart';
// import 'package:head_x/presentation/payments/cart_payment.dart';
// import 'package:head_x/presentation/order_details/order_summary.dart';
import 'package:head_x/presentation/product_details/widgets/specifications.dart';
import 'package:head_x/presentation/profile/addresses/widgets/select_address.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../application/cart_showing/cart_showing_bloc.dart';
import '../wishlist/widgets/favourite_icon.dart';

int length = 0;
int countOfProduct = 1;

class MainProductDetails extends StatelessWidget {
  const MainProductDetails(
      {super.key,
      required this.id,
      required this.index,
      required this.checking});
  final int index;
  final String id;
  final String checking;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
          final data = state.productList[index];
          // log(x)
          log(data.toString());
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
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                  List<Map<String, dynamic>> checkoutData = [];
                  List<Map<String, dynamic>> intoCheckout =
                      await checkout(checkoutData, data);
                  Navigator.pop(context);
                  BlocProvider.of<AddressShowingBloc>(context)
                      .add(InitializeAddress());
                  if (data['quantity'] > 0) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return AddressSelecting(
                            checking: 'normal', eachProduct: intoCheckout);
                      },
                    ));
                  } else if (data['quantity'] <= 0) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          title: Icon(
                            Icons.cancel_outlined,
                            size: 180,
                            color: Colors.red,
                          ),
                          content: Padding(
                            padding: EdgeInsets.only(left: 40),
                            child: Text(
                              'Out of Stock',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
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
                      checking: checking,
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

  Future<List<Map<String, dynamic>>> checkout(
      List<Map<String, dynamic>> checkoutData, dynamic data) async {
    checkoutData.add(data);
    return checkoutData;
  }
}
