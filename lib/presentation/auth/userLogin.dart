import 'package:flutter/material.dart';
import 'package:head_x/core/bottom_nav.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/core/uiConstant.dart';
import 'package:head_x/presentation/auth/userSignup.dart';
import 'package:head_x/presentation/home/main_home.dart';

import '../../main.dart';

class UserLogin extends StatelessWidget {
  const UserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: loginPageCr,
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        loginPageGap1,
        Container(
          width: myMediaQueryData.size.width * 0.5,
          height: myMediaQueryData.size.height * 0.27,
          decoration: loginContainer,
        ),
        loginPageGap2,
        Container(
          height: myMediaQueryData.size.height * 0.07,
          width: myMediaQueryData.size.height * 0.4,
          decoration: textformRadius,
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "  User id",
                labelStyle: labelColor),
          ),
        ),
        loginPageGap2,
        Container(
          height: myMediaQueryData.size.height * 0.07,
          width: myMediaQueryData.size.height * 0.4,
          decoration: textformRadius,
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "  Password",
                labelStyle: labelColor),
          ),
        ),
        loginPageGap3,
        Padding(
          padding: EdgeInsets.only(left: myMediaQueryData.size.width * 0.4),
          child: fPassword,
        ),
        loginPageGap4,
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return BottomNav();
              },
            ));
          },
          child: Padding(
            padding: EdgeInsets.only(left: myMediaQueryData.size.width * 0.03),
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
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(left: myMediaQueryData.size.width * 0.03),
                  child: createButton,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
