// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/wishlist_cheking/wishlist_checking_bloc.dart';
import 'package:head_x/core/bottom_nav.dart';
// import 'package:flutter/services.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/main.dart';
import 'package:head_x/presentation/home/main_home.dart';
// import 'package:head_x/presentation/order_details/main_orders.dart';
import 'package:head_x/presentation/splash_screen/splash_screen.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';

import '../../application/order_details/order_details_bloc.dart';

class MainOrderDetails extends StatelessWidget {
  const MainOrderDetails(
      {Key? key,
      required this.count,
      required this.name,
      required this.pname,
      required this.price,
      required this.remaining,
      required this.image,
      required this.total,
      required this.index})
      : super(key: key);
  final String name;
  final String remaining;
  final dynamic count;
  final dynamic price;
  final String pname;
  final String image;
  final dynamic total;
  final int index;

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
          SizedBox(
            height: myMediaQueryData.size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Do you want to cancel this order?'),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Cancel Order'),
                          content: const Text(
                              'Are you sure you want to cancel this order?'),
                          actions: [
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            ElevatedButton(
                              child: const Text('Delete'),
                              onPressed: () async {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                );
                                await cancelOrder();
                                await deleteFromOrders(index);
                                BlocProvider.of<OrderDetailsBloc>(context)
                                    .add(InitializeDetails());
                                Navigator.of(context).pop();
                                Navigator.pop(context);
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return BottomNav();
                                  },
                                ), (route) => false);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text('Cancel'))
            ],
          )
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

  Future<void> cancelOrder() async {
    List<dynamic> wantToUpdate = [];
    String productId = '';
    for (var mainProduct in productDetails) {
      if (mainProduct['name'] == pname) {
        final docData = await FirebaseFirestore.instance
            .collection('category')
            .doc(mainProduct['id'])
            .get();
        wantToUpdate = docData.data()?['product'] ?? [];
      }
    }
    for (var product in wantToUpdate) {
      if (product['name'] == pname) {
        productId = product['id'];
        product['quantity'] = product['quantity'] + count;
      }
    }
    await FirebaseFirestore.instance
        .collection('category')
        .doc(productId)
        .update({'product': wantToUpdate});
  }

  Future<void> deleteFromOrders(int index) async {
    log(index.toString());
    final docData = await gettingData(userId, 'users');
    List<dynamic> ordersList = docData.data()?['orders'] ?? [];
    ordersList.removeWhere((product) => product['name'] == pname);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({'orders': ordersList});
  }
}
