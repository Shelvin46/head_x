// import 'package:flutter/cupertino.dart';.

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/product_list/product_list_bloc.dart';
import 'package:head_x/application/search_bloc/search_bloc_bloc.dart';
// import 'package:head_x/presentation/categories/wireless_category/main_wireless.dart';
import 'package:head_x/presentation/product_details/product_details.dart';
import '../../../application/wishlist_cheking/wishlist_checking_bloc.dart';
import '../../../core/uiConstWidget.dart';
import '../../../main.dart';

class NormalShow extends StatelessWidget {
  const NormalShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductListBloc>(context).add(SearchIntoDetails());
    BlocProvider.of<WishlistCheckingBloc>(context).add(SearchWishlist());
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<SearchBlocBloc, SearchBlocState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.values.isEmpty) {
              return const Center(
                child: Text("No Data"),
              );
            }
            if (state.isNull == true) {
              return const Center(
                child: Text("No Data"),
              );
            }
            if (state.searchedProducts.isNotEmpty) {
              return GridView.builder(
                itemCount: state.searchedProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  mainAxisSpacing: 30.0, // Spacing between rows
                  crossAxisSpacing: 10.0, // Spacing between columns
                  mainAxisExtent: 250,
                ),
                itemBuilder: (context, index) {
                  // log(index.toString());
                  final product = state.searchedProducts[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return MainProductDetails(
                              id: product['id'],
                              index: state.values
                                  .indexOf(state.searchedProducts[index]));
                        },
                      ));
                      BlocProvider.of<ProductListBloc>(context)
                          .add(SearchIntoDetails());
                      BlocProvider.of<WishlistCheckingBloc>(context)
                          .add(SearchWishlist());

                      log(product['id'].toString());
                    },
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(height: myMediaQueryData.size.height * 0.03),
                          // Row(
                          //   mainAxisAlignment:
                          //       MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Container(
                          //       width: myMediaQueryData.size.width * 0.1,
                          //       height:
                          //           myMediaQueryData.size.height * 0.02,
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
                          //     InkWell(
                          //       onTap: () async {
                          //         await WishlistOpreations()
                          //             .wishlistUpdate(
                          //                 state.productList[index],
                          //                 userId);
                          //       },
                          //       child: const Icon(
                          //         Icons.favorite,
                          //         color: Colors.blue,
                          //         size: 34,
                          //       ),
                          //     )
                          //   ],
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 140,
                                width: 130,
                                // color: Colors.amber,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            product['images'][0]))),
                              )
                            ],
                          ),
                          cartGap2,
                          Row(
                            children: [
                              SizedBox(
                                width: myMediaQueryData.size.width * 0.01,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: '\u20B9', // Rupee symbol unicode
                                  style: const TextStyle(
                                      fontSize: 24, color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          '${product['price']}', // Price value
                                      style: const TextStyle(
                                          fontSize: 24, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                          Text(
                            product['name'],
                            style: productName,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return GridView.builder(
              itemCount: state.values.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                mainAxisSpacing: 30.0, // Spacing between rows
                crossAxisSpacing: 10.0, // Spacing between columns
                mainAxisExtent: 250,
              ),
              itemBuilder: (context, index) {
                // log(index.toString());
                final product = state.values[index];

                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return MainProductDetails(
                            id: product['id'], index: index);
                      },
                    ));
                    BlocProvider.of<WishlistCheckingBloc>(context)
                        .add(SearchWishlist());

                    log(product['id'].toString());
                  },
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: myMediaQueryData.size.height * 0.03),
                        // Row(
                        //   mainAxisAlignment:
                        //       MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Container(
                        //       width: myMediaQueryData.size.width * 0.1,
                        //       height:
                        //           myMediaQueryData.size.height * 0.02,
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
                        //     InkWell(
                        //       onTap: () async {
                        //         await WishlistOpreations()
                        //             .wishlistUpdate(
                        //                 state.productList[index],
                        //                 userId);
                        //       },
                        //       child: const Icon(
                        //         Icons.favorite,
                        //         color: Colors.blue,
                        //         size: 34,
                        //       ),
                        //     )
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 140,
                              width: 130,
                              // color: Colors.amber,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image:
                                          NetworkImage(product['images'][0]))),
                            )
                          ],
                        ),
                        cartGap2,
                        Row(
                          children: [
                            SizedBox(
                              width: myMediaQueryData.size.width * 0.01,
                            ),
                            Text.rich(
                              TextSpan(
                                text: '\u20B9', // Rupee symbol unicode
                                style: const TextStyle(
                                    fontSize: 24, color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '${product['price']}', // Price value
                                    style: const TextStyle(
                                        fontSize: 24, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        Text(
                          product['name'],
                          style: productName,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
