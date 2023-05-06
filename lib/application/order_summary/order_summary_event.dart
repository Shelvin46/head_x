part of 'order_summary_bloc.dart';

@immutable
abstract class OrderSummaryEvent {}

class CartCheckoutInitialize extends OrderSummaryEvent {}
