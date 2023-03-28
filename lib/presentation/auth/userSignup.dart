import 'package:flutter/material.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/presentation/auth/userLogin.dart';

import '../../main.dart';

class UserSignup extends StatelessWidget {
  const UserSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            Container(
              height: myMediaQueryData.size.height * 0.07,
              width: myMediaQueryData.size.height * 0.4,
              decoration: stextformRadius,
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "  Email id",
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
                    labelText: "  Create password",
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
                    labelText: "  Confirm password",
                    labelStyle: labelColor),
              ),
            ),
            loginPageGap2,
            Padding(
              padding:
                  EdgeInsets.only(left: myMediaQueryData.size.width * 0.03),
              child: csubmitButton,
            ),
          ],
        ),
      ),
    );
  }
}
