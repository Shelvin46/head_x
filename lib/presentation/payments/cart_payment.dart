// import 'dart:math';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/address_selecting/address_selecting_bloc.dart';
import 'package:head_x/application/order_summary/order_summary_bloc.dart';
import 'package:head_x/core/uiConstant.dart';
import 'package:head_x/main.dart';
// import 'package:head_x/presentation/payments/payment_screen.dart';
import 'package:head_x/presentation/payments/widgets/address_changing.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../core/uiConstWidget.dart';

class CartCheckout extends StatefulWidget {
  const CartCheckout({super.key, required this.name, required this.remaining});
  final String name;
  final String remaining;
  @override
  State<CartCheckout> createState() => _CartCheckoutState();
}

class _CartCheckoutState extends State<CartCheckout> {
  final _razorpay = Razorpay();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void makePayment() async {
    // var amount = widget.buynow ? buyNowTotals : total ?? 0;
    var options = {
      'key': 'rzp_test_3LZeDnsfAcnqSf',
      'amount': 100,
      'name': 'Head - X',
      'description': 'iPhone 14',
      'prefill': {'contact': '12345678', 'email': 'admin@gmail.com'}
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print("error :::::${e}");
    }
  }

  List<Map<String, dynamic>> payProducts = [];

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    log("PAyment");
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );

    // log()
    //the product present in the ordersumary bloc it will added into the a list
    // then compare that product present in the order bloc summary emitting list it is present then delete that product.
    //then call the event of ordersummary bloc.
  }

  void _handlePaymentError(PaymentFailureResponse response) {}

  void _handleExternalWallet(ExternalWalletResponse response) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BlocBuilder<OrderSummaryBloc, OrderSummaryState>(
        builder: (context, state) {
          payProducts.addAll(state.products);
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
                        onPressed: () {
                          makePayment();
                          log(payProducts.toString());
                        },
                        child: const Text('Place Order'))
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
                  BlocBuilder<AddressSelectingBloc, AddressSelectingState>(
                    builder: (context, state) {
                      if (state.addressLine1.isNotEmpty &&
                          state.addressLine2.isNotEmpty &&
                          state.name.isNotEmpty &&
                          state.city.isNotEmpty &&
                          state.code.isNotEmpty &&
                          state.state.isNotEmpty) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(state.name, style: addressName),
                                ],
                              ),
                            ),
                            addressGap,
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text('${state.addressLine1}'
                                      '\n'
                                      '${state.addressLine2}'
                                      '\n'
                                      '${state.city}${state.state}- ${state.code}'),
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                      return Column(children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.name, style: addressName),
                            ],
                          ),
                        ),
                        addressGap,
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(widget.remaining.toString()),
                            ),
                          ],
                        ),
                      ]);
                    },
                  )
                ],
              )),
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
