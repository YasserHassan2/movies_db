part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class getPopularMovies extends MainEvent {
  final int pageNumber;

  getPopularMovies(this.pageNumber);
}

class searchMovies extends MainEvent {
  final String query;

  searchMovies(this.query);
}
