// import 'dart:math';
// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:head_x/core/bottom_nav.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/core/uiConstant.dart';
import 'package:head_x/firebase/firebase_services/google_signin.dart';
import 'package:head_x/firebase/personDetails/details.dart';
import 'package:head_x/presentation/auth/userSignup.dart';
import 'package:head_x/presentation/home/main_home.dart';
import '../../main.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  var isLoading = true;

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: loginPageCr,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          loginPageGap1,
          Container(
            width: myMediaQueryData.size.width * 0.5,
            height: myMediaQueryData.size.height * 0.27,
            decoration: loginContainer,
          ),
          loginPageGap2,
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: myMediaQueryData.size.height * 0.07,
                  width: myMediaQueryData.size.height * 0.4,
                  decoration: textformRadius,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    cursorHeight: 20,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a mail id';
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Mail id",
                      labelStyle: labelColor,
                      contentPadding: const EdgeInsets.only(left: 16.0),
                    ),
                  ),
                ),
                loginPageGap2,
                Container(
                  height: myMediaQueryData.size.height * 0.07,
                  width: myMediaQueryData.size.height * 0.4,
                  decoration: textformRadius,
                  child: TextFormField(
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    cursorHeight: 20,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Password';
                      }
                      return null;
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Password",
                      labelStyle: labelColor,
                      contentPadding: const EdgeInsets.only(left: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          loginPageGap3,
          // loginPageGap4,
          InkWell(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text)
                    .then((value) async {
                  await AddingDetails().detailsAdding();
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return BottomNav();
                    },
                  ));
                }).onError((error, stackTrace) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(error.toString().split("]")[1].trim()),
                      backgroundColor: Colors.blue,
                    ),
                  );
                });
              }
            },
            child: Padding(
              padding:
                  EdgeInsets.only(left: myMediaQueryData.size.width * 0.03),
              child: submitButton,
            ),
          ),
          loginPageGap4,
          Padding(
            padding: EdgeInsets.only(left: myMediaQueryData.size.width * 0.1),
            child: Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: myMediaQueryData.size.width * 0.03),
                  child: createAcc,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return UserSignup();
                      },
                    ));
                    globalFirstName.clear();
                    globalLastName.clear();
                    globalMobileNumber.clear();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: myMediaQueryData.size.width * 0.03),
                    child: createButton,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
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
              await FiireBaseGoogle().signInWithGoogle();
              log(userId);
              await AddingDetails().detailsAdding();
              Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return BottomNav();
                },
              ));
            },
            child: Container(
              width: 300,
              height: 70,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/signin.png"),
                fit: BoxFit.fill,
              )),
            ),
          )
        ]),
      ),
    );
  }
}
