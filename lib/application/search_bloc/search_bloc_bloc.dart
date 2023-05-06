import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
part 'search_bloc_event.dart';
part 'search_bloc_state.dart';

class SearchBlocBloc extends Bloc<SearchBlocEvent, SearchBlocState> {
  SearchBlocBloc() : super(SearchBlocInitial()) {
    on<InitialSearch>((event, emit) async {
      List<dynamic> initialProducts = await get();
      return emit(SearchBlocState(isLoading: false, values: initialProducts));
    });
  }
}

Future<List<dynamic>> get() async {
  List<dynamic> searchData = [];
  final data = await FirebaseFirestore.instance.collection('category').get();
  for (var docs in data.docs) {
    final eachData = await FirebaseFirestore.instance
        .collection('category')
        .doc(docs.id)
        .get();
    final productDetails = eachData.data()?['product'] ?? [];
    for (var product in productDetails) {
      searchData.add(product);
    }
    log(searchData.toString());
  }
  return searchData;
}
