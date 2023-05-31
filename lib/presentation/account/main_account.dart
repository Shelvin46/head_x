import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/for_username/for_username_bloc.dart';
import 'package:head_x/application/wishlist_listing/wishlist_listing_bloc.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/firebase/firebase_services/google_signin.dart';
import 'package:head_x/main.dart';
import 'package:head_x/presentation/account/widgets/account_details.dart';
import 'package:head_x/presentation/auth/userLogin.dart';
import 'package:head_x/presentation/order_details/main_orders.dart';
import 'package:head_x/presentation/profile/addresses/main_address.dart';
import 'package:head_x/presentation/profile/edit_profile/edit_profile_one.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';
import 'package:head_x/presentation/widgets/privacy_policy.dart';
import 'package:head_x/presentation/widgets/terms_and_conditions.dart';
import 'package:head_x/presentation/wishlist/main_wishlist.dart';
import '../../application/address_showing/address_showing_bloc.dart';

class MainAccount extends StatelessWidget {
  const MainAccount({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ForUsernameBloc>(context).add(InitializeUsername());
    });
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: BlocBuilder<ForUsernameBloc, ForUsernameState>(
            builder: (context, state) {
              final name = state.name;
              return Container(
                width: 100,
                height: 100,
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: myMediaQueryData.size.width * 0.04,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: myMediaQueryData.size.height * 0.03),
                        child: Text(
                          "Hey!! $name",
                          style: accSection,
                        ))
                  ],
                ),
              );
            },
          )),
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
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title: const Text('Terms and Conditions'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    //  mainAxisAlignment: MainAxisAlignment.cent,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text('$termsAndConditions'
                                          '\n'
                                          '\n'
                                          '$nextLines1'
                                          '\n'),
                                      Text(
                                        headingOne,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Text(nextLines3),
                                      Text(
                                        'Contact Us',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Text(nextLines4)
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('Close'),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                  ),
                                ]);
                          },
                        );
                      },
                      child: AccountDetails(
                          icon: Icons.edit_document,
                          text: "Terms & Conditions"),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title: const Text('Terms and Conditions'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    //  mainAxisAlignment: MainAxisAlignment.cent,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text('$privacyLine1'
                                          '\n'),
                                      Text(
                                        'Information Collection and Use',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Text('$privacyLine2' '\n'),
                                      Text(
                                        'Log Data',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        '$privacyLine3' '\n',
                                      ),
                                      Text(
                                        'Cookies',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        '$privacyLine4' '\n',
                                      ),
                                      Text(
                                        'Children’s Privacy',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        '$privacyLine5' '\n',
                                      ),
                                      Text(
                                        'Changes to This Privacy Policy',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        '$privacyLine6' '\n',
                                      ),
                                      Text(
                                        'Contact US',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        '$privacyLine7' '\n',
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('Close'),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                  ),
                                ]);
                          },
                        );
                      },
                      child: AccountDetails(
                          icon: Icons.privacy_tip_outlined,
                          text: "Privacy Policy"),
                    ),
                    SizedBox(
                      height: myMediaQueryData.size.height * 0.04,
                    ),
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () async {
                            await FiireBaseGoogle().signOut();
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return UserLogin();
                              },
                            ));
                          },
                          child: Text(
                            'Log Out',
                            style: TextStyle(color: Colors.blue, fontSize: 18),
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
