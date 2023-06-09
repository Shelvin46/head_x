part of 'wishlist_checking_bloc.dart';

@immutable
abstract class WishlistCheckingEvent {}

class Checking extends WishlistCheckingEvent {
  String id;
  String idofMain;
  Checking({required this.id, required this.idofMain});
}

class WishlistChecking extends WishlistCheckingEvent {
  List<dynamic> values;
  String id;
  WishlistChecking({required this.values, required this.id});
}

class SearchWishlist extends WishlistCheckingEvent {
  List<dynamic> wishlistProducts;
  SearchWishlist({required this.wishlistProducts});
}

class RecentlyWishlist extends WishlistCheckingEvent {}

class CartWishlistChecking extends WishlistCheckingEvent {}
