part of 'order_details_bloc.dart';

class OrderDetailsState {
  List<dynamic> orderDetails;
  bool isLoading;
  OrderDetailsState({required this.isLoading, required this.orderDetails});
}

class OrderDetailsInitial extends OrderDetailsState {
  OrderDetailsInitial() : super(isLoading: true, orderDetails: []);
}
