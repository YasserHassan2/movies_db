part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class getPopularMovies extends MainEvent {
  int pageNumber;

  getPopularMovies(this.pageNumber);
}
