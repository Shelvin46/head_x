part of 'indicator_bloc_bloc.dart';

@immutable
abstract class IndicatorBlocEvent {}

class ChangingIndex extends IndicatorBlocEvent {
  int index;
  ChangingIndex({required this.index});
}
