import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/main.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';

class MainOrderDetails extends StatelessWidget {
  const MainOrderDetails(
      {Key? key,
      required this.count,
      required this.name,
      required this.pname,
      required this.price,
      required this.remaining,
      required this.image,
      required this.total})
      : super(key: key);
  final String name;
  final String remaining;
  final dynamic count;
  final dynamic price;
  final String pname;
  final String image;
  final dynamic total;

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
          SizedBox(
            width: myMediaQueryData.size.width * 0.5,
            height: myMediaQueryData.size.height * 0.220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    orderGap1,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pname,
                          style: orderDetailText1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('₹$price', style: orderPrice)
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 14, 15, 0),
                      child: Container(
                        height: myMediaQueryData.size.height * 0.150,
                        width: myMediaQueryData.size.width * 0.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(image),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    detailsGap,
                    Text(
                      'Quantity - $count'.toString(),
                      style: detailsText,
                    )
                  ],
                )
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: myMediaQueryData.size.height * 0.20,
              width: myMediaQueryData.size.height * 0.4,
              decoration: decoration,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: nameStyle,
                    ),
                    Text(
                      remaining,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ),

          // SizedBox(
          //     width: double.infinity,
          //     height: myMediaQueryData.size.height * 0.450,
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         orderGap3,
          //         Row(
          //           children: [
          //             Padding(
          //               padding: EdgeInsets.only(
          //                   left: myMediaQueryData.size.width * 0.06),
          //               child: const CircleAvatar(
          //                 radius: 15,
          //                 backgroundColor: Colors.blue,
          //               ),
          //             ),
          //             orderGap4,
          //             Text("Order Placed", style: orderStatus)
          //           ],
          //         ),
          //         Padding(
          //           padding: EdgeInsets.only(
          //               left: myMediaQueryData.size.width * 0.085),
          //           child: Container(
          //             height: 110,
          //             width: 10,
          //             color: Colors.grey,
          //           ),
          //         ),
          //         Row(
          //           children: [
          //             Padding(
          //               padding: EdgeInsets.only(
          //                   left: myMediaQueryData.size.width * 0.06),
          //               child: const CircleAvatar(
          //                 radius: 15,
          //                 backgroundColor: Colors.grey,
          //               ),
          //             ),
          //             orderGap4,
          //             Text("Order Shipped", style: orderStatus)
          //           ],
          //         ),
          //         Padding(
          //           padding: EdgeInsets.only(
          //               left: myMediaQueryData.size.width * 0.085),
          //           child: Container(
          //             height: 110,
          //             width: 10,
          //             color: Colors.grey,
          //           ),
          //         ),
          //         Row(
          //           children: [
          //             Padding(
          //               padding: EdgeInsets.only(
          //                   left: myMediaQueryData.size.width * 0.06),
          //               child: const CircleAvatar(
          //                 radius: 15,
          //                 backgroundColor: Colors.grey,
          //               ),
          //             ),
          //             orderGap4,
          //             Text("Deliverd", style: orderStatus)
          //           ],
          //         ),
          //       ],
          //     )),
        ],
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: myMediaQueryData.size.height * 0.08,
        color: const Color.fromARGB(255, 228, 224, 224),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Amount:',
                style: nameStyle,
              ),
              Text(
                '₹$total'.toString(),
                style: nameStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
