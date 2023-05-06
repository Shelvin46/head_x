part of 'countof_cart_bloc.dart';

class CountofCartState {
  List<dynamic> cartProducts;
  CountofCartState({required this.cartProducts});
}

class CountofCartInitial extends CountofCartState {
  CountofCartInitial() : super(cartProducts: []);
}
