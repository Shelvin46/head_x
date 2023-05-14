part of 'address_showing_bloc.dart';

class AddressShowingState {
  List<dynamic> addresses;
  bool isLoading;
  AddressShowingState({required this.addresses, required this.isLoading});
}

class AddressShowingInitial extends AddressShowingState {
  AddressShowingInitial() : super(addresses: [], isLoading: true);
}
