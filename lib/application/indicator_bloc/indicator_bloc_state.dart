part of 'indicator_bloc_bloc.dart';

class IndicatorBlocState {
  int activeIndex;
  IndicatorBlocState({required this.activeIndex});
}

class IndicatorBlocInitial extends IndicatorBlocState {
  IndicatorBlocInitial() : super(activeIndex: 0);
}
