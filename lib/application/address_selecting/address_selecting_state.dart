part of 'address_selecting_bloc.dart';

class AddressSelectingState {
  String name;
  String addressLine1;
  String addressLine2;
  String city;
  String state;
  String code;
  AddressSelectingState({
    required this.addressLine1,
    required this.name,
    required this.addressLine2,
    required this.city,
    required this.code,
    required this.state,
  });
}

class AddressSelectingInitial extends AddressSelectingState {
  AddressSelectingInitial()
      : super(
            addressLine1: "",
            name: "",
            addressLine2: "",
            city: "",
            code: "",
            state: "");
}
