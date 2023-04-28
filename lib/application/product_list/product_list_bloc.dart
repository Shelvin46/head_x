import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:head_x/application/wishlist_listing/wishlist_listing_bloc.dart';

import 'package:meta/meta.dart';

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
    // on<WishlistDisplay>((event, emit) {
    //   return emit(
    //       ProductListState(productList: [], isLoading: false));
    // });
  }
}
