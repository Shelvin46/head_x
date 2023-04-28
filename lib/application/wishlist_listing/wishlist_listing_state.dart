part of 'wishlist_listing_bloc.dart';

class WishlistListingState {
  bool isLoading;
  List<Map<String, dynamic>> values;
  WishlistListingState({required this.values, required this.isLoading});
}

class WishlistListingInitial extends WishlistListingState {
  WishlistListingInitial() : super(isLoading: true, values: []);
}
