// import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:head_x/application/search_bloc/search_bloc_bloc.dart';
// import 'package:head_x/application/search_bloc/search_bloc_bloc.dart';
import 'package:head_x/application/wishlist_listing/wishlist_listing_bloc.dart';
import 'package:head_x/firebase/cart/cart_opreation.dart';
import 'package:head_x/presentation/categories/wireless_category/main_wireless.dart';
import 'package:head_x/presentation/home/main_home.dart';
import 'package:meta/meta.dart';

import '../../presentation/splash_screen/splash_screen.dart';
part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc() : super(ProductListInitial()) {
    on<InitializeDisplay>((event, emit) async {
      final docData = await FirebaseFirestore.instance
          .collection('category')
          .doc(event.id)
          .get();
      final productDetails = docData.data()?['product'] ?? [];
      return emit(
          ProductListState(productList: productDetails, isLoading: false));
    });
    on<WishlistProductDisplay>((event, emit) {
      return emit(
          ProductListState(productList: productOfWishlist, isLoading: false));
    });
    on<SearchIntoDetails>((event, emit) async {
      return emit(
          ProductListState(productList: productDetails, isLoading: false));
    });
    // on<RecentlyDetails>((event, emit) async {
    //   return emit(
    //       ProductListState(productList: recentlyAllProducts, isLoading: false));
    // });
    on<CartDetails>((event, emit) async {
      List<dynamic> cartProducts = await CartOperation().get(userId);
      return emit(
          ProductListState(productList: cartProducts, isLoading: false));
    });
  }
}
