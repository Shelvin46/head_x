import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/product_list/product_list_bloc.dart';
import 'package:head_x/application/search_bloc/search_bloc_bloc.dart';
import 'package:head_x/core/uiConstant.dart';
import 'package:head_x/firebase/recently/recently_opreation.dart';
import 'package:head_x/presentation/product_details/product_details.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';
// import '../../../application/recently_products/recently_products_bloc.dart';
import '../../../application/wishlist_cheking/wishlist_checking_bloc.dart';
import '../../../core/uiConstWidget.dart';
import '../../../main.dart';

List<dynamic> fromAll = [];
final String userId = FirebaseAuth.instance.currentUser!.email.toString();

class MainWirelessHeadphones extends StatelessWidget {
  const MainWirelessHeadphones(
      {super.key, required this.id, required this.title});
  final String title;
  final String id;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<WishlistCheckingBloc>(context)
          .add(Checking(id: userId, idofMain: id));
    });
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWidget(title: title, appbarColor: eachCatBar),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: cartbacColor,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<ProductListBloc, ProductListState>(
                  builder: (context, state) {
                    if (state.productList.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state.isLoading == true) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return GridView.builder(
                      itemCount: state.productList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 30.0,
                        crossAxisSpacing: 10.0,
                        mainAxisExtent: 250,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final product = state.productList[index];
                        return InkWell(
                          onTap: () async {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return MainProductDetails(
                                  id: id,
                                  index: index,
                                );
                              },
                            ));
                            // log(product.toString());
                            await RecentlyOpreation().recentlyAdding(product);
                            
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
                                                fontSize: 24,
                                                color: Colors.black),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
