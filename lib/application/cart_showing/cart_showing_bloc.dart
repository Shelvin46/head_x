import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:head_x/firebase/cart/cart_opreation.dart';
import 'package:head_x/presentation/categories/wireless_category/main_wireless.dart';
import 'package:meta/meta.dart';
part 'cart_showing_event.dart';
part 'cart_showing_state.dart';

List<Map<String, dynamic>> productOfCart = [];

class CartShowingBloc extends Bloc<CartShowingEvent, CartShowingState> {
  CartShowingBloc() : super(CartShowingInitial()) {
    on<CartgShowing>((event, emit) async {
      List<Map<String, dynamic>> cartProducts =
          await CartOperation().get(userId);
      return emit(CartShowingState(cartValues: cartProducts, isLoading: false));
    });
  }
}
