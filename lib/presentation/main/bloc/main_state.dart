part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainLoading extends MainState {}

class MainSuccess extends MainState {
  PopularMoviesModel popularMoviesModel;

  MainSuccess(this.popularMoviesModel);
}

class MainFailure extends MainState {
  String message;
  String code;

  MainFailure(this.message, this.code);
}
