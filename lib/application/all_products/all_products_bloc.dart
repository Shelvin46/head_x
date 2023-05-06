import 'package:bloc/bloc.dart';
import 'package:head_x/application/search_bloc/search_bloc_bloc.dart';
import 'package:meta/meta.dart';

part 'all_products_event.dart';
part 'all_products_state.dart';

class AllProductsBloc extends Bloc<AllProductsEvent, AllProductsState> {
  AllProductsBloc() : super(AllProductsInitial()) {
    on<FromAllProducts>((event, emit) async {
      List<dynamic> allProducts = await get();
      return emit(AllProductsState(isLoading: false, productList: allProducts));
    });
  }
}
