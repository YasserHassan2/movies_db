part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent {}

class getMovieDetails extends MovieDetailsEvent {
  final String movieId;

  getMovieDetails(this.movieId);
}

class addMovieToFavourites extends MovieDetailsEvent {
  final Movie movie;

  addMovieToFavourites(this.movie);
}
