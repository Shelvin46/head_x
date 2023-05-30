import 'package:flutter/material.dart';

import '../../../core/uiConstWidget.dart';
import '../../../main.dart';

class ColorAndDesc extends StatelessWidget {
  const ColorAndDesc({
    super.key,
    required this.value,
  });

  final value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        productGap2,
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            height: myMediaQueryData.size.height * 0.07,
            width: myMediaQueryData.size.height * 0.2,
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey,
                      blurStyle: BlurStyle.normal)
                ],
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: TextFormField(
              // initialValue: "Color",
              controller: TextEditingController(text: value['color']),
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              cursorColor: Colors.white,
              cursorHeight: 20,
              readOnly: true,
              decoration: InputDecoration(
                prefixText: "Color:    ",
                border: InputBorder.none,
                labelStyle: labelColor,
                contentPadding: const EdgeInsets.only(left: 16.0),
              ),
            ),
          ),
        ),
        productGap2,
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "Description",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Color.fromARGB(255, 117, 111, 111)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            height: myMediaQueryData.size.height * 0.5,
            width: myMediaQueryData.size.height * 0.425,
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey,
                      blurStyle: BlurStyle.normal)
                ],
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: TextFormField(
              maxLines: 100,
              controller: TextEditingController(text: value['description']),
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              cursorColor: Colors.white,
              cursorHeight: 20,
              readOnly: true,
              decoration: InputDecoration(
                // prefixText: "D:    ",
                border: InputBorder.none,
                labelStyle: labelColor,
                contentPadding: const EdgeInsets.only(left: 16.0),
              ),
            ),
          ),
        ),

        // ProductSpecification(
        //   color: specColor,
        //   text1: "Description:",
        //   text2: value['description'],
        // ),
        SizedBox(
          height: myMediaQueryData.size.height * 0.07,
        )
      ],
    );
  }
}