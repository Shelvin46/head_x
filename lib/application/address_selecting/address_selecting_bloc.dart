import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'address_selecting_event.dart';
part 'address_selecting_state.dart';

class AddressSelectingBloc
    extends Bloc<AddressSelectingEvent, AddressSelectingState> {
  AddressSelectingBloc() : super(AddressSelectingInitial()) {
    on<SelectingAddress>((event, emit) {
      return emit(AddressSelectingState(
          name: event.name,
          addressLine1: event.addressLine1,
          addressLine2: event.addressLine2,
          city: event.city,
          code: event.code,
          state: event.state));
    });
  }
}
