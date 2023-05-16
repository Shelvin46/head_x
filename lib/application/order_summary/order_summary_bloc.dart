import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:head_x/firebase/cart/cart_opreation.dart';
import 'package:head_x/presentation/categories/wireless_category/main_wireless.dart';
import 'package:meta/meta.dart';
part 'order_summary_event.dart';
part 'order_summary_state.dart';

class OrderSummaryBloc extends Bloc<OrderSummaryEvent, OrderSummaryState> {
  OrderSummaryBloc() : super(OrderSummaryInitial()) {
    on<CartCheckoutInitialize>((event, emit) async {
      List<Map<String, dynamic>> products = await CartOperation().get(userId);
      for (var cartProduct in products) {
        final docData = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();
        final name = cartProduct['name'];
        for (var product in docData.data()?['cart'] ?? []) {
          if (product['name'] == name) {
            cartProduct['price'] = cartProduct['price'] * product['count'];
          }
        }
      }
      return emit(OrderSummaryState(isLoading: false, products: products));
    });
    on<EachProductCheckout>((event, emit) {
      return emit(
          OrderSummaryState(isLoading: false, products: event.eachProduct
          ));
    });
  }
}
