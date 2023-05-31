part of 'for_username_bloc.dart';

class ForUsernameState {
  String name;
  ForUsernameState({required this.name});
}

class ForUsernameInitial extends ForUsernameState {
  ForUsernameInitial() : super(name: "");
}
