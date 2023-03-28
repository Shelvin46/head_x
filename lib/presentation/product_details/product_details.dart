import 'package:flutter/material.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/core/uiConstant.dart';
import 'package:head_x/main.dart';
import 'package:head_x/presentation/product_details/widgets/specifications.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';

class MainProductDetails extends StatelessWidget {
  MainProductDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        key: UniqueKey(),
        children: [
          Container(
            width: myMediaQueryData.size.width * 0.5,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                )),
            child: Center(
                child: Text(
              "Add to cart",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            )),
          ),
          Container(
            width: myMediaQueryData.size.width * 0.5,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
                child: Text(
              "Buy Now",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            )),
          )
        ],
      ),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(
              title: "Product Details", appbarColor: orderDetails)),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: myMediaQueryData.size.width * 1,
          height: myMediaQueryData.size.height * 1.4,
          //color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: myMediaQueryData.size.height * 0.7,
                // color: Colors.red,
                child: Column(
                  children: [
                    productGap1,
                    Padding(
                      padding: EdgeInsets.only(
                        left: myMediaQueryData.size.width * 0.8,
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.blue,
                        size: 38,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: myMediaQueryData.size.height * 0.5,
                      decoration: productMainimage,
                    ),
                    productGap1,
                    SizedBox(
                      height: 90,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 90,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(subPages[index]),
                                  fit: BoxFit.fill,
                                )),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Padding(padding: EdgeInsets.all(8.0));
                          },
                          itemCount: subPages.length),
                    )
                  ],
                ),
              ),
              productGap2,
              Padding(
                padding:
                    EdgeInsets.only(left: myMediaQueryData.size.width * 0.02),
                child: Text(
                  "boAt Bassheads 100 Wired Headset\n(Black, In the Ear)",
                  style: productTitileStyle,
                  maxLines: 2,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: myMediaQueryData.size.width * 0.02),
                child: Text(
                  "₹999",
                  style: productPriceStyle,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: myMediaQueryData.size.width * 0.02),
                child: Text(
                  "Available Colors",
                  style: productPriceStyle,
                ),
              ),
              //  productGap2,
              SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Expanded(
                              child: Container(
                                width: 50,
                                height: 100,
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text("Red")
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Padding(padding: EdgeInsets.all(8.0));
                      },
                      itemCount: 4),
                ),
              ),
              productGap2,
              Padding(
                padding:
                    EdgeInsets.only(left: myMediaQueryData.size.width * 0.02),
                child: Text("Specifications", style: productPriceStyle),
              ),
              Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  productGap2,
                  ProductSpecification(
                    color: specColor,
                    text1: "Model Name:",
                    text2: " RMA2016",
                  ),
                  productGap2,
                  ProductSpecification(
                    color: specColor,
                    text1: "Headphone Type:",
                    text2: " In the Ear",
                  ),
                  productGap2,
                  ProductSpecification(
                    color: specColor,
                    text1: "Headphone Driver units:",
                    text2: " 11.2mm",
                  ),
                  productGap2,
                  ProductSpecification(
                    color: specColor,
                    text1: "With Microphone:",
                    text2: " Yes",
                  ),
                  productGap2,
                  ProductSpecification(
                      color: specColor, text1: "Length:", text2: " 1mm")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List subPages = [
    "assets/classic -2.jpeg",
    "assets/1.jpeg",
    "assets/2.jpeg",
    "assets/3.jpeg",
  ];
}
