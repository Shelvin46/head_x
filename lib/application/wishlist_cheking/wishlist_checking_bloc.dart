import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/gestures.dart';
// import 'package:head_x/application/product_list/product_list_bloc.dart';
import 'package:head_x/application/search_bloc/search_bloc_bloc.dart';
import 'package:head_x/presentation/categories/wireless_category/main_wireless.dart';
import 'package:meta/meta.dart';
part 'wishlist_checking_event.dart';
part 'wishlist_checking_state.dart';

class WishlistCheckingBloc
    extends Bloc<WishlistCheckingEvent, WishlistCheckingState> {
  WishlistCheckingBloc() : super(WishlistCheckingInitial()) {
    on<Checking>((event, emit) async {
      final docData = await gettingData(event.idofMain, "category");
      final daocDataWishlist = await gettingData(event.id, "users");
      final mainProductList = docData.data()?['product'] ?? [];
      final wishlistProducts = daocDataWishlist.data()?['wishlist'] ?? [];
      return emit(WishlistCheckingState(
          valuesOfEachCategory: mainProductList,
          valuesOfWishlist: wishlistProducts,
          isLoading: false));
    });
    on<WishlistChecking>((event, emit) async {
      final daocDataWishlist = await gettingData(event.id, "users");
      final wishlistProducts = daocDataWishlist.data()?['wishlist'] ?? [];
      return emit(WishlistCheckingState(
          valuesOfEachCategory: event.values,
          valuesOfWishlist: wishlistProducts,
          isLoading: false));
    });
    on<SearchWishlist>((event, emit) async {
      final docData = await gettingData(userId, "users");
      final wishlistProducts = docData.data()?['wishlist'] ?? [];
      List<dynamic> searchProducts = await get();
      
      return emit(WishlistCheckingState(
          valuesOfEachCategory: searchProducts,
          valuesOfWishlist: wishlistProducts,
          isLoading: false));
    });
  }
}

Future<DocumentSnapshot<Map<String, dynamic>>> gettingData(
    String id, String collection) async {
  final docData =
      await FirebaseFirestore.instance.collection(collection).doc(id).get();
  return docData;
}
