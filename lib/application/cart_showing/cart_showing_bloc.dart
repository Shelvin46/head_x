import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:head_x/firebase/cart/cart_opreation.dart';
import 'package:head_x/presentation/categories/wireless_category/main_wireless.dart';
import 'package:head_x/presentation/home/main_home.dart';
import 'package:meta/meta.dart';
part 'cart_showing_event.dart';
part 'cart_showing_state.dart';

List<Map<String, dynamic>> productOfCart = [];
List<dynamic> cartProducts = [];
List<dynamic> dummyCarts = [];

class CartShowingBloc extends Bloc<CartShowingEvent, CartShowingState> {
  CartShowingBloc() : super(CartShowingInitial()) {
    on<CartgShowing>((event, emit) async {
      cartProducts = await CartOperation().get(userId);
      final docData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      dummyCarts = docData.data()?['cart'] ?? [];

      for (var product in cartProducts) {
        final name = product['name'];
        for (var element in dummyCarts) {
          if (element['name'] == name) {
            product['price'] = product['price'] * element['count'];
          }
        }
      }

      return emit(CartShowingState(
        cartValues: cartProducts,
        isLoading: false,
      ));
    });
  }
}
