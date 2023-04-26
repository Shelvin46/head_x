part of 'product_list_bloc.dart';

class ProductListState {
  List<dynamic> productList;
  bool isLoading;
  ProductListState({required this.productList, required this.isLoading});
}

class ProductListInitial extends ProductListState {
  ProductListInitial() : super(isLoading: true, productList: []);
}
