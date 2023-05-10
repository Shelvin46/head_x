import 'package:bloc/bloc.dart';
import 'package:head_x/firebase/recently/recently_opreation.dart';
import 'package:meta/meta.dart';
part 'recently_products_event.dart';
part 'recently_products_state.dart';

class RecentlyProductsBloc
    extends Bloc<RecentlyProductsEvent, RecentlyProductsState> {
  RecentlyProductsBloc() : super(RecentlyProductsInitial()) {
    on<InitialRecently>((event, emit) async {
      List<Map<String, dynamic>> recentlyProducts =
          await RecentlyOpreation().recentlyGet();
      return emit(
          RecentlyProductsState(isLoadindg: false, products: recentlyProducts));
    });
  }
}
