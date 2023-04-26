part of 'wishlist_checking_bloc.dart';

class WishlistCheckingState {
  List<dynamic> valuesOfWishlist;
  List<dynamic> valuesOfEachCategory;
  bool isLoading;
  WishlistCheckingState(
      {required this.valuesOfEachCategory,
      required this.valuesOfWishlist,
      required this.isLoading});
}

class WishlistCheckingInitial extends WishlistCheckingState {
  WishlistCheckingInitial()
      : super(isLoading: true, valuesOfEachCategory: [], valuesOfWishlist: []);
}
