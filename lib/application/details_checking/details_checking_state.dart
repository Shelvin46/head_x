part of 'details_checking_bloc.dart';

class DetailsCheckingState {
  String firstName;
  String lastName;
  String mobileNo;
  String userid;
  String photo;
  bool isLoading;
  DetailsCheckingState(
      {required this.firstName,
      required this.mobileNo,
      required this.lastName,
      required this.userid,
      required this.isLoading,
      required this.photo});
}

class DetailsCheckingInitial extends DetailsCheckingState {
  DetailsCheckingInitial()
      : super(
            firstName: "",
            mobileNo: "",
            lastName: "",
            userid: "",
            isLoading: true,
            photo: "");
}
