// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/address_selecting/address_selecting_bloc.dart';
import 'package:head_x/application/address_showing/address_showing_bloc.dart';
import 'package:head_x/application/wishlist_cheking/wishlist_checking_bloc.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/presentation/home/main_home.dart';
import 'package:head_x/presentation/payments/cart_payment.dart';
import 'package:head_x/presentation/profile/addresses/widgets/adding_address.dart';
// import 'package:head_x/core/uiConstant.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';
import '../../../../application/order_summary/order_summary_bloc.dart';
import '../../../../main.dart';

class AddressSelecting extends StatefulWidget {
  const AddressSelecting(
      {super.key, required this.checking, required this.eachProduct});
  final String checking;
  final List<Map<String, dynamic>> eachProduct;

  @override
  State<AddressSelecting> createState() => _AddressSelectingState();
}

class _AddressSelectingState extends State<AddressSelecting> {
  dynamic val;

  @override
  Widget build(BuildContext context) {
    // each = widget.eachProduct;
    // for (var element in widget.eachProduct) {
    //   each.add(element);
    // }
    // log(each.toString());
    List<Map<String, dynamic>> each = [];

    return Scaffold(
      bottomSheet: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return AddressAddingPage();
                  },
                ));
              },
              child: forAddress)),
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
              title: "Select Address", appbarColor: Color(0xFF3A72DD))),
      body: Column(
        children: [
          SizedBox(
            height: myMediaQueryData.size.height * 0.04,
          ),
          BlocBuilder<AddressShowingBloc, AddressShowingState>(
            builder: (context, state) {
              if (state.addresses.isEmpty) {
                // checkingEmpty = state.addresses;
                return const Center(
                    child: Text(
                  'Please add a address',
                  style: TextStyle(fontSize: 24),
                ));
              }
              return ListView.separated(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final data = state.addresses[index];
                    return SizedBox(
                      height: 100,
                      child: RadioListTile(
                        value: index,
                        groupValue: val,
                        onChanged: (changed) {
                          setState(() {
                            val = changed;
                          });
                          BlocProvider.of<AddressSelectingBloc>(context).add(
                              SelectingAddress(
                                  addressLine2: data['addressLine2'],
                                  name: data['name'],
                                  addressLine1: data['addressLine1'],
                                  city: data['city'],
                                  code: data['zipcode'].toString(),
                                  state: data['state']));
                        },
                        title: Text(data['name']),
                        subtitle: Text('${data['addressLine1']}'
                            '\n'
                            '${data['addressLine2']}'
                            '\n'
                            '${data['city']}${data['state']}- ${data['zipcode']}'),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: state.addresses.length);
            },
          ),
          BlocBuilder<AddressShowingBloc, AddressShowingState>(
            builder: (context, state) {
              if (state.addresses.isEmpty) {
                return Container();
              }
              return ElevatedButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                    final doData = await gettingData(userId, 'users');
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return CartCheckout(
                            name: "",
                            remaining: "",
                            checking: widget.checking,
                            cartProducts: doData.data()?['cart'] ?? []);
                      },
                    ));
                    if (widget.checking == 'normal') {
                      each.addAll(widget.eachProduct);
                      // List<Map<String, dynamic>> product = widget.eachProduct;
                      BlocProvider.of<OrderSummaryBloc>(context)
                          .add(EachProductCheckout(eachProduct: each));
                    } else if (widget.checking == 'fromCart') {
                      BlocProvider.of<OrderSummaryBloc>(context)
                          .add(CartCheckoutInitialize());
                    }
                    log(each.toString());
                    // each.clear();
                  },
                  child: const Text('Continue'));
            },
          )
        ],
      ),
    );
  }
}
