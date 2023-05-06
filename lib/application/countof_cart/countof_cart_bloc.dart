import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:head_x/presentation/categories/wireless_category/main_wireless.dart';
import 'package:meta/meta.dart';
part 'countof_cart_event.dart';
part 'countof_cart_state.dart';

class CountofCartBloc extends Bloc<CountofCartEvent, CountofCartState> {
  CountofCartBloc() : super(CountofCartInitial()) {
    on<InitializeCount>((event, emit) async {
      final docData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      List<dynamic> cartProducts = docData.data()?['cart'] ?? [];
      return emit(CountofCartState(cartProducts: cartProducts));
    });
  }
}
