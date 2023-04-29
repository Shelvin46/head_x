part of 'cart_showing_bloc.dart';

class CartShowingState {
  bool isLoading;
  List<dynamic> cartValues;
  CartShowingState({required this.cartValues, required this.isLoading});
}

class CartShowingInitial extends CartShowingState {
  CartShowingInitial() : super(cartValues: [], isLoading: true);
}
