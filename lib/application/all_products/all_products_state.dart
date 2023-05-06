part of 'all_products_bloc.dart';

class AllProductsState {
  List<dynamic> productList;
  bool isLoading;
  AllProductsState({required this.isLoading, required this.productList});
}

class AllProductsInitial extends AllProductsState {
  AllProductsInitial() : super(isLoading: true, productList: []);
}
