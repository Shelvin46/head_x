import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/cart_showing/cart_showing_bloc.dart';
import 'package:head_x/application/order_summary/order_summary_bloc.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:head_x/core/uiConstant.dart';
import 'package:head_x/main.dart';
import 'package:head_x/presentation/payments/widgets/address_changing.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';

import '../../core/uiConstWidget.dart';

// int total = 0;

class CartCheckout extends StatelessWidget {
  const CartCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BlocBuilder<OrderSummaryBloc, OrderSummaryState>(
        builder: (context, state) {
          dynamic total = 0;
          for (var product in state.products) {
            total = total + product['price'];
          }

          return Container(
              width: double.infinity,
              height: 60,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\u20B9${total.toString()}',
                      style: cartPriceStyle,
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Place Order'))
                  ],
                ),
              ));
        },
      ),
      backgroundColor: cartPaymentBac,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
            title: "Order Summary", appbarColor: Color(0xFF3A72DD)),
      ),
      body: Column(
        children: [
          addressGap,
          Container(
            width: double.infinity,
            height: myMediaQueryData.size.height * 0.250,
            color: Colors.white,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: AdressChanging(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shelvin Varghese", style: addressName),
                    ],
                  ),
                ),
                addressGap,
                const Padding(
                  padding: EdgeInsets.only(right: 130),
                  child: Text(
                      "451, perumadan house, Thramani,\nAnamari(Po), Kollengode, \nPalakkad, Kerala - 678506"),
                ),
              ],
            ),
          ),
          addressGap,
          Expanded(
            child: BlocBuilder<OrderSummaryBloc, OrderSummaryState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state.products.isEmpty) {
                  return const Center(
                    child: Text("No PRoducts"),
                  );
                }
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final data = state.products[index];

                      return Container(
                        height: myMediaQueryData.size.height * 0.2,
                        color: Colors.white,
                        child: Row(
                          children: [
                            SizedBox(
                              width: myMediaQueryData.size.width * 0.02,
                            ),
                            Container(
                              height: myMediaQueryData.size.height * 0.180,
                              width: myMediaQueryData.size.height * 0.180,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(data['images'][0]),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: myMediaQueryData.size.width * 0.05,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: myMediaQueryData.size.height * 0.03),
                                  child: Text(
                                    data['name'],
                                    style: cartPaymentName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  height: myMediaQueryData.size.height * 0.05,
                                ),
                                Text(
                                  '\u20B9 ${data['price'].toString()}',
                                  style: cartPriceStyle,
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return accGap1;
                    },
                    itemCount: state.products.length);
              },
            ),
          ),
        ],
      ),
    );
  }
}
