import 'package:bloc/bloc.dart';

import 'package:head_x/firebase/wishlist/wishlist_opreation.dart';
import 'package:head_x/presentation/categories/wireless_category/main_wireless.dart';
import 'package:head_x/presentation/home/main_home.dart';
import 'package:meta/meta.dart';

part 'wishlist_listing_event.dart';
part 'wishlist_listing_state.dart';

List<Map<String, dynamic>> productOfWishlist = [];

class WishlistListingBloc
    extends Bloc<WishlistListingEvent, WishlistListingState> {
  WishlistListingBloc() : super(WishlistListingInitial()) {
    on<InitializeWishlist>((event, emit) async {
      productOfWishlist = await WishlistOpreations().get(userId);
      return emit(
          WishlistListingState(values: productOfWishlist, isLoading: false));
    });
  }
}
