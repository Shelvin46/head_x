import 'package:flutter/material.dart';
import 'package:head_x/core/uiConstant.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';

import '../../../core/uiConstWidget.dart';
import '../../../main.dart';

class MainNeckbands extends StatelessWidget {
  const MainNeckbands({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(title: "Neckbands", appbarColor: eachCatBar)),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: cartbacColor,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: 7,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    mainAxisSpacing: 30.0, // Spacing between rows
                    crossAxisSpacing: 10.0, // Spacing between columns
                    mainAxisExtent: 250,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: myMediaQueryData.size.width * 0.1,
                                height: myMediaQueryData.size.height * 0.02,
                                color: ratingColor,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: cartPadding,
                                      child: Text(
                                        "4.0",
                                        style: ratingStyle,
                                      ),
                                    ),
                                    const Spacer(),
                                    starIcon,
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.favorite,
                                color: Colors.blue,
                                size: 34,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 140,
                                width: 130,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: AssetImage(
                                            "assets/classic -2.jpeg"))),
                              )
                            ],
                          ),
                          cartGap2,
                          Row(
                            children: [
                              SizedBox(
                                width: myMediaQueryData.size.width * 0.01,
                              ),
                              Text(
                                "₹1999",
                                style: priceStyle,
                              ),
                              const Spacer(),
                            ],
                          ),
                          Text(
                            "realme Buds Classic",
                            style: productName,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
