part of 'recently_products_bloc.dart';

class RecentlyProductsState {
  bool isLoadindg;
  List<Map<String, dynamic>> products;
  RecentlyProductsState({required this.isLoadindg, required this.products});
}

class RecentlyProductsInitial extends RecentlyProductsState {
  RecentlyProductsInitial() : super(isLoadindg: true, products: []);
}
