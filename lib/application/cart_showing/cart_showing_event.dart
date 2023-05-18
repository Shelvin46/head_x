part of 'cart_showing_bloc.dart';

@immutable
abstract class CartShowingEvent {}

class CartgShowing extends CartShowingEvent {}

class ForCount extends CartShowingEvent {
  int count;
  ForCount({required this.count});
}
