part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsSuccess extends MovieDetailsState {
  final Movie movie;

  MovieDetailsSuccess(this.movie);
}

class AddedToFavouritesSuccess extends MovieDetailsState {
  AddedToFavouritesSuccess();
}

class MovieDetailsFailure extends MovieDetailsState {
  final String message;
  final String code;

  MovieDetailsFailure(this.message, this.code);
}
