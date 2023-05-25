import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/wishlist_listing/wishlist_listing_bloc.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/firebase/firebase_services/google_signin.dart';
import 'package:head_x/main.dart';
import 'package:head_x/presentation/account/widgets/account_details.dart';
import 'package:head_x/presentation/auth/userLogin.dart';
import 'package:head_x/presentation/order_details/main_order_details.dart';
import 'package:head_x/presentation/order_details/main_orders.dart';
import 'package:head_x/presentation/profile/addresses/main_address.dart';
import 'package:head_x/presentation/profile/edit_profile/edit_profile_one.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';
import 'package:head_x/presentation/wishlist/main_wishlist.dart';

import '../../application/address_showing/address_showing_bloc.dart';
import '../../firebase/personDetails/details.dart';
import '../auth/userSignup.dart';

class MainAccount extends StatelessWidget {
  const MainAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
            title: "Hey! Shelvin Varghese", appbarColor: Colors.white),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(67, 171, 163, 163),
        child: Column(
          children: [
            accGap1,
            Container(
              height: myMediaQueryData.size.height * 0.2,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: myMediaQueryData.size.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return MainOrders();
                              },
                            ));
                          },
                          child: Container(
                            width: myMediaQueryData.size.width * 0.4,
                            height: myMediaQueryData.size.height * 0.05,
                            // color: Colors.amber,
                            decoration: accDec,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.shopping_bag,
                                  size: 35,
                                ),
                                Text(
                                  "Orders",
                                  style: accText1,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return MainWishlist();
                              },
                            ));
                            BlocProvider.of<WishlistListingBloc>(context)
                                .add(InitializeWishlist());
                          },
                          child: Container(
                            width: myMediaQueryData.size.width * 0.4,
                            height: myMediaQueryData.size.height * 0.05,
                            // color: Colors.amber,
                            decoration: accDec,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.favorite,
                                  size: 35,
                                ),
                                Text(
                                  "Wishlist",
                                  style: accText1,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: myMediaQueryData.size.height * 0.02),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: myMediaQueryData.size.width * 0.05,
                        ),
                        Container(
                          width: myMediaQueryData.size.width * 0.4,
                          height: myMediaQueryData.size.height * 0.05,
                          // color: Colors.amber,
                          decoration: accDec,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(
                                Icons.headphones_outlined,
                                size: 35,
                              ),
                              Text(
                                "Help Center",
                                style: accText2,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            accGap1,
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: myMediaQueryData.size.height * 0.02),
                      child: Text(
                        "Account Settings",
                        style: accText,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return EditProfileOne();
                          },
                        ));
                        // log(globalFirstName.text);
                      
                      },
                      child: AccountDetails(
                          icon: Icons.account_circle_outlined,
                          text: "Edit Profile"),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return MainAddresses();
                          },
                        ));
                        BlocProvider.of<AddressShowingBloc>(context)
                            .add(InitializeAddress());
                      },
                      child: AccountDetails(
                          icon: Icons.location_on_outlined,
                          text: "Saved Addresses"),
                    ),
                    AccountDetails(
                        icon: Icons.notifications_none,
                        text: "Nottification Settings"),
                    AccountDetails(
                        icon: Icons.lock_outline_rounded,
                        text: "Change Password"),
                    SizedBox(
                      height: myMediaQueryData.size.height * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: myMediaQueryData.size.width * 0.04),
                      child: Text(
                        "Feedback & Information",
                        style: accText,
                      ),
                    ),
                    AccountDetails(
                        icon: Icons.edit_document, text: "Terms & Conditions"),
                    AccountDetails(icon: Icons.info_outline, text: "About"),
                    Center(
                      child: InkWell(
                        onTap: () async {
                          await FiireBaseGoogle().signOut();
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return UserLogin();
                            },
                          ));
                        },
                        child: Container(
                          height: myMediaQueryData.size.height * 0.04,
                          width: myMediaQueryData.size.width * 0.2,
                          color: Colors.blue,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: myMediaQueryData.size.width * 0.02),
                            child: Text(
                              "Logout",
                              style: logStyle,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
