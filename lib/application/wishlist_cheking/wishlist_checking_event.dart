part of 'wishlist_checking_bloc.dart';

@immutable
abstract class WishlistCheckingEvent {}

class Checking extends WishlistCheckingEvent {
  String id;
  String idofMain;
  Checking({required this.id,required this.idofMain});
}
