import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:head_x/core/uiConstant.dart';
import 'package:head_x/main.dart';
import 'package:head_x/presentation/payments/payment_screen.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';

class MainOrderSummary extends StatelessWidget {
  const MainOrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
              title: "Order Summary", appbarColor: Color(0xFF3A72DD))),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: cartbacColor,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: myMediaQueryData.size.height * 0.250,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Deliver to:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Change",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: myMediaQueryData.size.width * 0.04),
                    child: Text(
                      "Shelvin Varghese",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: myMediaQueryData.size.width * 0.04),
                    child: Text(
                      "451, perumadan house, Thramani,\nAnamari(Po), Kollengode,\nPalakkad, Kerala - 678506",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 180,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 6, 0, 0),
                        child: Container(
                          width: myMediaQueryData.size.width * 0.350,
                          height: myMediaQueryData.size.height * 0.2,
                          //color: Colors.red,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/4.jpeg"),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 6, 0, 0),
                        child: Container(
                          width: myMediaQueryData.size.width * 0.620,
                          height: myMediaQueryData.size.height * 0.2,
                          //color: Colors.red,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "boAt Bassheads 100 Wired\nHeadset(Black, In the Ear)",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "₹999",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: myMediaQueryData.size.height * 0.250,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Price Details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Price",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 22),
                          ),
                          Text(
                            "₹999",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // color: Colors.grey,
                                fontSize: 25),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery Charge",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 22),
                          ),
                          Text(
                            "+49",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // color: Colors.grey,
                                fontSize: 25),
                          )
                        ]),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Ammount",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // color: Colors.grey,
                                fontSize: 22),
                          ),
                          Text(
                            "₹1049",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // color: Colors.grey,
                                fontSize: 25),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: myMediaQueryData.size.height * 0.06,
                width: myMediaQueryData.size.width * 0.5,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
