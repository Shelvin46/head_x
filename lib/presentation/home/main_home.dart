// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/product_list/product_list_bloc.dart';
import 'package:head_x/application/recently_products/recently_products_bloc.dart';
import 'package:head_x/application/wishlist_cheking/wishlist_checking_bloc.dart';
// import 'package:head_x/application/search_bloc/search_bloc_bloc.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/firebase/personDetails/details.dart';
// import 'package:head_x/presentation/auth/userSignup.dart';
import 'package:head_x/presentation/product_details/product_details.dart';
import 'package:head_x/presentation/search/main_search.dart';
import 'package:head_x/presentation/splash_screen/splash_screen.dart';
import '../../application/countof_cart/countof_cart_bloc.dart';
import '../../application/search_bloc/search_bloc_bloc.dart';
import '../../firebase/recently/recently_opreation.dart';
import '../../main.dart';
// import '../categories/wireless_category/main_wireless.dart';

final String userId = FirebaseAuth.instance.currentUser!.email.toString();
final String fromGooglePhoto =
    FirebaseAuth.instance.currentUser!.photoURL.toString();
final String fromGoogleName =
    FirebaseAuth.instance.currentUser!.displayName.toString();
final String fromGoogleEmail =
    FirebaseAuth.instance.currentUser!.email.toString();
final String fromGooglePhone =
    FirebaseAuth.instance.currentUser!.phoneNumber.toString();

class MainHome extends StatelessWidget {
  MainHome({super.key});
  final listImage = [
    "assets/banner-1.png",
    "assets/music-you-banner-web-template_23-2148641826.jpg",
    "assets/gadget-concept-landing-page-template_23-2148626924.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CountofCartBloc>(context).add(InitializeCount());
    BlocProvider.of<RecentlyProductsBloc>(context).add(InitialRecently());
    BlocProvider.of<ProductListBloc>(context).add(RecentlyDetails());
    BlocProvider.of<WishlistCheckingBloc>(context).add(RecentlyWishlist());
    BlocProvider.of<ProductListBloc>(context).add(SearchIntoDetails());
    BlocProvider.of<WishlistCheckingBloc>(context)
        .add(SearchWishlist(wishlistProducts: wishlistAllProducts));
    // log(globalFirstName.text.toString());
    function();

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homePageGap1,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: myMediaQueryData.size.width * 0.04),
                  child: homePageLogo,
                ),
                gap,
                heading,
              ],
            ),
            homePageGap2,
            GestureDetector(
              child: SizedBox(
                width: myMediaQueryData.size.width * 0.97,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: myMediaQueryData.size.width * 0.03),
                  child: TextField(
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255)),
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const MainSearch();
                        },
                      ));
                      BlocProvider.of<SearchBlocBloc>(context)
                          .add(InitialSearch());
                    },
                    onChanged: (value) async {},
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: Colors.white,
                      ),
                      focusColor: Colors.white,
                      hintText: 'Explore Your Headphones',
                      hintStyle: TextStyle(color: Color(0xFF052F3D)),
                      filled: true,
                      fillColor: Color(0xFFB3CDD6),
                    ),
                  ),
                ),
              ),
            ),
            homePageGap1,
            CarouselSlider.builder(
                itemCount: listImage.length,
                itemBuilder: (context, index, realIndex) {
                  final listOne = listImage[index];
                  return buildImage(listOne, index);
                },
                options: CarouselOptions(
                    pageSnapping: false,
                    enableInfiniteScroll: false,
                    height: 170,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    viewportFraction: 1)),
            homePageGap2,
            homePageGap2,
            Padding(
              padding:
                  EdgeInsets.only(left: myMediaQueryData.size.width * 0.04),
              child: allText,
            ),
            homePageGap2,
            Column(
              children: [
                BlocBuilder<SearchBlocBloc, SearchBlocState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: state.values.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 30.0,
                          crossAxisSpacing: 10.0,
                          mainAxisExtent: 250,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final eachProduct = state.values[index];
                          return InkWell(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              );
                              final docData =
                                  await gettingData(userId, "users");
                              List<dynamic> wishlistProducts =
                                  docData.data()?['wishlist'] ?? [];
                              BlocProvider.of<ProductListBloc>(context)
                                  .add(SearchIntoDetails());
                              BlocProvider.of<WishlistCheckingBloc>(context)
                                  .add(SearchWishlist(
                                      wishlistProducts: wishlistProducts));
                              Navigator.pop(context);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return MainProductDetails(
                                    id: eachProduct['id'],
                                    index: index,
                                    checking: 'normal',
                                  );
                                },
                              ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 242, 240, 240),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  SizedBox(
                                      height:
                                          myMediaQueryData.size.height * 0.03),
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
                                                    eachProduct['images'][0]))),
                                      )
                                    ],
                                  ),
                                  cartGap2,
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            myMediaQueryData.size.width * 0.01,
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          text: '\u20B9',
                                          style: const TextStyle(
                                              fontSize: 24,
                                              color: Colors.black),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: eachProduct['price']
                                                  .toString(), // Price value
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
                                    eachProduct['name'],
                                    style: productName,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                )
              ],
            )
          ],
        ),
      )),
    );
  }

  Widget buildImage(String image, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: myMediaQueryData.size.width * 0.9,
        // color: Colors.green,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Future<void> function() async {
    recentlyAllProducts = await RecentlyOpreation().recentlyGet();
    final docData = await gettingData(userId, "users");
    wishlistAllProducts =
        docData.data()?['wishlist'] ?? []; //all wishlist prducts
    // FirebaseAuth.instance.currentUser.displayName
   
  }
  // Future
}
