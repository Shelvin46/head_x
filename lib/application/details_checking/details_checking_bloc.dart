import 'package:bloc/bloc.dart';
import 'package:head_x/application/wishlist_cheking/wishlist_checking_bloc.dart';
import 'package:head_x/presentation/home/main_home.dart';
import 'package:meta/meta.dart';

part 'details_checking_event.dart';
part 'details_checking_state.dart';

class DetailsCheckingBloc
    extends Bloc<DetailsCheckingEvent, DetailsCheckingState> {
  DetailsCheckingBloc() : super(DetailsCheckingInitial()) {
    on<ForDetails>((event, emit) async {
      final docData = await gettingData(userId, "users");
      List<dynamic> details = await docData.data()?['personDetails'] ?? [];
      String firstName = "";
      String lastName = "";
      String mobileNo = "";
      String user = "";
      String photo = "";

      for (var element in details) {
        firstName = element['firstname'];
        lastName = element['lastname'];
        mobileNo = element['mobileno'];
        user = element['mailid'];
        photo = element['photo'];
      }
      return emit(DetailsCheckingState(
          firstName: firstName,
          mobileNo: mobileNo,
          lastName: lastName,
          userid: user,
          isLoading: false,
          photo: photo));
    });
  }
}
