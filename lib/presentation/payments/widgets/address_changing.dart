// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:head_x/core/uiConstWidget.dart';

class AdressChanging extends StatelessWidget {
  const AdressChanging({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Deliver to", style: addressName),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Change To",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
