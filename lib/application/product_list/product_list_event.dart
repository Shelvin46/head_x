part of 'product_list_bloc.dart';

@immutable
abstract class ProductListEvent {}

class InitializeDisplay extends ProductListEvent {
  String id;
  InitializeDisplay({required this.id});
}
