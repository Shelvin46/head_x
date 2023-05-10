part of 'search_bloc_bloc.dart';

@immutable
abstract class SearchBlocEvent {}

class InitialSearch extends SearchBlocEvent {}

class UpdateSearch extends SearchBlocEvent {
  String query;
  UpdateSearch({required this.query});
}
