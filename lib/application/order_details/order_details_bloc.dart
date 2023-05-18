import 'package:bloc/bloc.dart';
import 'package:head_x/application/wishlist_cheking/wishlist_checking_bloc.dart';
import 'package:head_x/presentation/home/main_home.dart';
import 'package:meta/meta.dart';

part 'order_details_event.dart';
part 'order_details_state.dart';

class OrderDetailsBloc extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  OrderDetailsBloc() : super(OrderDetailsInitial()) {
    on<InitializeDetails>((event, emit) async {
      final docData = await gettingData(userId, 'users');
      return emit(OrderDetailsState(
          isLoading: false, orderDetails: docData.data()?['orders'] ?? []));
    });
  }
}
