import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/main.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';

class MainOrderDetails extends StatelessWidget {
  const MainOrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: "Order Details",
          appbarColor: Color(0xFF3A72DD),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            width: myMediaQueryData.size.width * 0.5,
            height: myMediaQueryData.size.height * 0.220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    orderGap1,
                    Text(
                      "boAt Bassheads 100\nWired Headset\n(Black, In the Ear)",
                      style: orderDetailText1,
                    ),
                    orderGap2,
                    Container(
                      height: myMediaQueryData.size.height * 0.1,
                      width: myMediaQueryData.size.width * 0.2,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        image: DecorationImage(
                          image: AssetImage("assets/4.jpeg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: myMediaQueryData.size.width * 0.05,
                  ),
                  child: Text("Blue"),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: myMediaQueryData.size.width * 0.05,
                  ),
                  child: Text("₹999", style: orderPrice),
                )
              ],
            ),
          ),
          const Divider(),
          Container(
              width: double.infinity,
              height: myMediaQueryData.size.height * 0.450,
              //  color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  orderGap3,
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: myMediaQueryData.size.width * 0.06),
                        child: const CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                      orderGap4,
                      Text("Order Placed", style: orderStatus)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: myMediaQueryData.size.width * 0.085),
                    child: Container(
                      height: 110,
                      width: 10,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: myMediaQueryData.size.width * 0.06),
                        child: const CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      orderGap4,
                      Text("Order Shipped", style: orderStatus)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: myMediaQueryData.size.width * 0.085),
                    child: Container(
                      height: 110,
                      width: 10,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: myMediaQueryData.size.width * 0.06),
                        child: const CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      orderGap4,
                      Text("Deliverd", style: orderStatus)
                    ],
                  ),
                ],
              )),
          //Divider(),
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.blue,
            child: Center(child: Text("Cancel Order", style: cancelOrder)),
          ),
          SizedBox(
            height: myMediaQueryData.size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Ammount:",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                Spacer(),
                Text(
                  "₹999",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Delivery Charge:",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                Spacer(),
                Text(
                  "+49",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Total Ammount:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "₹1049",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
