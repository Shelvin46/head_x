import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:head_x/presentation/categories/wireless_category/main_wireless.dart';
import 'package:head_x/presentation/home/main_home.dart';
import 'package:meta/meta.dart';

part 'address_showing_event.dart';
part 'address_showing_state.dart';

class AddressShowingBloc
    extends Bloc<AddressShowingEvent, AddressShowingState> {
  AddressShowingBloc() : super(AddressShowingInitial()) {
    on<InitializeAddress>((event, emit) async {
      final docData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      List<dynamic> addresses = docData.data()?['address'] ?? [];
      return emit(AddressShowingState(addresses: addresses, isLoading: false));
    });
  }
}
