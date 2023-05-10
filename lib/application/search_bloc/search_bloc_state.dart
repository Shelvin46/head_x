part of 'search_bloc_bloc.dart';

class SearchBlocState {
  List<dynamic> values;
  bool isLoading;
  bool isNull;
  List<dynamic> searchedProducts;
  SearchBlocState({
    required this.isLoading,
    required this.values,
    required this.searchedProducts,
    required this.isNull,
  });
}

class SearchBlocInitial extends SearchBlocState {
  SearchBlocInitial()
      : super(isLoading: true, values: [], isNull: false, searchedProducts: []);
}
