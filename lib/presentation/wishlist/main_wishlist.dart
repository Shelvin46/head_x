import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/product_list/product_list_bloc.dart';
// import 'package:head_x/application/product_list/product_list_bloc.dart';
// import 'package:head_x/application/product_list/product_list_bloc.dart';
import 'package:head_x/application/wishlist_listing/wishlist_listing_bloc.dart';
import 'package:head_x/firebase/wishlist/wishlist_opreation.dart';
// import 'package:head_x/presentation/categories/main_category.dart';
import 'package:head_x/presentation/categories/wireless_category/main_wireless.dart';
import 'package:head_x/presentation/home/main_home.dart';
import 'package:head_x/presentation/product_details/product_details.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';
import 'package:lottie/lottie.dart';
import '../../application/wishlist_cheking/wishlist_checking_bloc.dart';
import '../../core/uiConstWidget.dart';
import '../../core/uiConstant.dart';
import '../../main.dart';

class MainWishlist extends StatelessWidget {
  const MainWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
              title: "My Wishlist", appbarColor: Color(0xFF798BE7))),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: cartbacColor,
        child: Column(
          children: [
            cartGap,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<WishlistListingBloc, WishlistListingState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state.values.isEmpty) {
                      return Column(
                        children: [
                          Lottie.asset('assets/123724-wishlist-empty.json'),
                          const Text(
                            "Please add any items into Wishlist",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      );
                    }

                    return GridView.builder(
                      itemCount: state.values.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        mainAxisSpacing: 30.0, // Spacing between rows
                        crossAxisSpacing: 10.0, // Spacing between columns
                        mainAxisExtent: 287,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final data = state.values[index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return MainProductDetails(
                                  id: data['id'],
                                  index: index,
                                  checking: "normal",
                                );
                              },
                            ));
                            BlocProvider.of<ProductListBloc>(context)
                                .add(WishlistProductDisplay());
                            BlocProvider.of<WishlistCheckingBloc>(context).add(
                                WishlistChecking(
                                    values: state.values, id: userId));
                          },
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                SizedBox(
                                    height:
                                        myMediaQueryData.size.height * 0.03),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Container(
                                //       width: myMediaQueryData.size.width * 0.1,
                                //       height: myMediaQueryData.size.height * 0.02,
                                //       color: ratingColor,
                                //       child: Row(
                                //         children: [
                                //           Padding(
                                //             padding: cartPadding,
                                //             child: Text(
                                //               "4.0",
                                //               style: ratingStyle,
                                //             ),
                                //           ),
                                //           const Spacer(),
                                //           starIcon,
                                //         ],
                                //       ),
                                //     ),
                                //     const Icon(
                                //       Icons.favorite,
                                //       color: Colors.blue,
                                //       size: 34,
                                //     )
                                //   ],
                                // ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 140,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  data['images'][0]))),
                                    )
                                  ],
                                ),
                                cartGap2,
                                Row(
                                  children: [
                                    SizedBox(
                                      width: myMediaQueryData.size.width * 0.01,
                                    ),
                                    Text(
                                      '₹${data['price']}'.toString(),
                                      style: priceStyle,
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                Text(
                                  data['name'],
                                  style: productName,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                // Container(
                                //   width: double.infinity,
                                //   height: 50,
                                //   decoration: BoxDecoration(
                                //       border: Border.all(color: Colors.black)),
                                //   child: const Center(
                                //       child: Text(
                                //     "Add to Cart",
                                //     style: TextStyle(
                                //         fontWeight: FontWeight.bold,
                                //         fontSize: 30,
                                //         color: Colors.blue),
                                //   )),
                                // ),
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
                                    await WishlistOpreations()
                                        .detletion(data, index, userId);
                                    BlocProvider.of<WishlistListingBloc>(
                                            context)
                                        .add(InitializeWishlist());
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: const Center(
                                        child: Text(
                                      "Remove",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          color: Colors.black),
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
