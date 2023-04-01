import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/presentation/auth/userLogin.dart';

import '../../main.dart';

class UserSignup extends StatelessWidget {
  UserSignup({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return UserLogin();
                        },
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: bacakArrow,
                    ),
                  ),
                ],
              ),
              createGap,
              signupText,
              loginPageGap2,
              Container(
                height: myMediaQueryData.size.height * 0.07,
                width: myMediaQueryData.size.height * 0.4,
                decoration: stextformRadius,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "  Firstname",
                      labelStyle: labelColor),
                ),
              ),
              loginPageGap2,
              Container(
                height: myMediaQueryData.size.height * 0.07,
                width: myMediaQueryData.size.height * 0.4,
                decoration: stextformRadius,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "  Lastname",
                      labelStyle: labelColor),
                ),
              ),
              loginPageGap2,
              Container(
                height: myMediaQueryData.size.height * 0.07,
                width: myMediaQueryData.size.height * 0.4,
                decoration: stextformRadius,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "  Mobile no",
                      labelStyle: labelColor),
                ),
              ),
              loginPageGap2,
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      height: myMediaQueryData.size.height * 0.07,
                      width: myMediaQueryData.size.height * 0.4,
                      decoration: stextformRadius,
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a Emai id';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Email id",
                            labelStyle: labelColor,
                            contentPadding: EdgeInsets.only(left: 16)),
                      ),
                    ),
                    // loginPageGap2,
                    loginPageGap2,
                    Container(
                      height: myMediaQueryData.size.height * 0.07,
                      width: myMediaQueryData.size.height * 0.4,
                      decoration: stextformRadius,
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          return null;
                        },
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Create password",
                            labelStyle: labelColor,
                            contentPadding: EdgeInsets.only(left: 16)),
                      ),
                    ),
                  ],
                ),
              ),
              loginPageGap2,
              Padding(
                padding:
                    EdgeInsets.only(left: myMediaQueryData.size.width * 0.03),
                child: InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      )
                          .then((value) {
                        Navigator.pop(context);
                      }).onError((error, stackTrace) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(error.toString()),
                            backgroundColor: Colors.blue,
                          ),
                        );
                      });
                    }
                  },
                  child: csubmitButton,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
