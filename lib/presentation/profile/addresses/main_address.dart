import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/core/uiConstant.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';

class MainAddresses extends StatelessWidget {
  const MainAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
                title: "My Addresses", appbarColor: Color(0xFFDE40C5))),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: cartbacColor,
          child: Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text(
                    "+ Add a new address",
                    style: addressText1,
                  ),
                ),
              ),
              addressGap,
              Container(
                width: double.infinity,
                height: 180,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Shelvin Varghese", style: addressName),
                          const Icon(
                            Icons.more_vert,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                    addressGap,
                    Padding(
                      padding: EdgeInsets.only(right: 130),
                      child: Text(
                          "451, perumadan house, Thramani,\nAnamari(Po), Kollengode, \nPalakkad, Kerala - 678506"),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
