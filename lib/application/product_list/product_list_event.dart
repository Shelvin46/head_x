part of 'product_list_bloc.dart';

@immutable
abstract class ProductListEvent {}

// ignore: must_be_immutable
class InitializeDisplay extends ProductListEvent {
  String id;
  InitializeDisplay({required this.id});
}

class WishlistProductDisplay extends ProductListEvent {}


// class WishlistDisplay extends ProductListEvent {}
