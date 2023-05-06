part of 'search_bloc_bloc.dart';

class SearchBlocState {
  List<dynamic> values;
  bool isLoading;
  SearchBlocState({required this.isLoading, required this.values});
}

class SearchBlocInitial extends SearchBlocState {
  SearchBlocInitial() : super(isLoading: true, values: []);
}
