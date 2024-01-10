part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainLoading extends MainState {}

class MainSuccess extends MainState {
  final PopularMoviesModel popularMoviesModel;

  MainSuccess(this.popularMoviesModel);
}
class MainSearchSuccess extends MainState {
  final PopularMoviesModel popularMoviesModel;

  MainSearchSuccess(this.popularMoviesModel);
}

class MainFailure extends MainState {
  final String message;
  final String code;

  MainFailure(this.message, this.code);
}
