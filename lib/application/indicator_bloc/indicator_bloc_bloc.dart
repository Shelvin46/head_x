import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'indicator_bloc_event.dart';
part 'indicator_bloc_state.dart';

class IndicatorBlocBloc extends Bloc<IndicatorBlocEvent, IndicatorBlocState> {
  IndicatorBlocBloc() : super(IndicatorBlocInitial()) {
    on<ChangingIndex>((event, emit) {
      return emit(IndicatorBlocState(activeIndex: event.index));
    });
  }
}
