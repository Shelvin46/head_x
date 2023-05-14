part of 'order_summary_bloc.dart';

@immutable
abstract class OrderSummaryEvent {}

class CartCheckoutInitialize extends OrderSummaryEvent {}

class EachProductCheckout extends OrderSummaryEvent {
  List<Map<String, dynamic>> eachProduct;
  EachProductCheckout({required this.eachProduct});
}
