import 'package:flutter/material.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';
import '../../core/uiConstWidget.dart';
import '../../core/uiConstant.dart';
import '../../main.dart';

class MainWishlist extends StatelessWidget {
  const MainWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
              title: "My Wishlist", appbarColor: Color(0xFF798BE7))),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: cartbacColor,
        child: Column(
          children: [
            cartGap,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: 7,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    mainAxisSpacing: 30.0, // Spacing between rows
                    crossAxisSpacing: 10.0, // Spacing between columns
                    mainAxisExtent: 350,
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
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: const Center(
                                child: Text(
                              "Add to Cart",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.blue),
                            )),
                          ),
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: const Center(
                                child: Text(
                              "Remove",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.black),
                            )),
                          )
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
