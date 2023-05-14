part of 'address_selecting_bloc.dart';

@immutable
abstract class AddressSelectingEvent {}

class SelectingAddress extends AddressSelectingEvent {
  String name;
  String addressLine1;
  String addressLine2;
  String city;
  String code;
  String state;

  SelectingAddress(
      {required this.addressLine2,
      required this.name,
      required this.addressLine1,
      required this.city,
      required this.code,
      required this.state});
}
