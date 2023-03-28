import 'package:flutter/material.dart';
import 'package:head_x/presentation/order_details/main_order_details.dart';
import 'package:head_x/presentation/product_details/product_details.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';

import '../../core/uiConstWidget.dart';

class MainOrders extends StatelessWidget {
  const MainOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
                title: "My Orders", appbarColor: Color(0xFF798BE7))),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return MainOrderDetails();
                    },
                  ));
                },
                child: ListTile(
                  leading: Expanded(
                      child: Container(
                    width: 90,
                    //   color: Colors.amber,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/4.jpeg"))),
                  )),
                  title: Text(
                    "Order Placed",
                    style: mainTitle,
                  ),
                  subtitle: const Text(
                      "Your order for Sony WH-XB910N\nsuccessfully placed tab here for\nmore details"),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return notiLine;
            },
            itemCount: 2));
  }
}
