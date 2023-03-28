import 'package:flutter/material.dart';

import '../../../main.dart';

class AccountDetails extends StatelessWidget {
  AccountDetails({super.key, required this.icon, required this.text});
  IconData icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: myMediaQueryData.size.width * 0.03,
          height: myMediaQueryData.size.height * 0.05,
        ),
        Icon(
          icon,
          color: Colors.blue,
          size: 30,
        ),
        SizedBox(
          width: myMediaQueryData.size.width * 0.03,
          height: myMediaQueryData.size.height * 0.05,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
