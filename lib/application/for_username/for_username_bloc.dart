import 'package:bloc/bloc.dart';
import 'package:head_x/application/wishlist_cheking/wishlist_checking_bloc.dart';
import 'package:head_x/presentation/home/main_home.dart';
part 'for_username_event.dart';
part 'for_username_state.dart';

class ForUsernameBloc extends Bloc<ForUsernameEvent, ForUsernameState> {
  ForUsernameBloc() : super(ForUsernameInitial()) {
    on<InitializeUsername>((event, emit) async {
      final docData = await gettingData(userId, 'users');
      List<dynamic> data = docData.data()?['personDetails'] ?? [];
      String firstName = data[0]['firstname'];
      String lastname = data[0]['lastname'];
      String fullName = '$firstName $lastname';

      return emit(ForUsernameState(name: fullName));
    });
  }
}
