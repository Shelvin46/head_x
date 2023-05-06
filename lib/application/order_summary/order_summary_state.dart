part of 'order_summary_bloc.dart';

class OrderSummaryState {
  bool isLoading;
  List<Map<String, dynamic>> products;
  OrderSummaryState({required this.isLoading, required this.products});
}

class OrderSummaryInitial extends OrderSummaryState {
  OrderSummaryInitial() : super(isLoading: true, products: []);
}
