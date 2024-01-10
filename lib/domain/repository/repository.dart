import 'package:dartz/dartz.dart';
import 'package:victory_link_movies/domain/model/popular_movies_model.dart';
import 'package:victory_link_movies/domain/requests/movie_details_request.dart';
import 'package:victory_link_movies/domain/requests/popular_movies_request.dart';
import 'package:victory_link_movies/domain/requests/search_movies_request.dart';

import '../../data/network/failure.dart';

abstract class Repository {
  Future<Either<Failure, PopularMoviesModel>> getPopularMovies(
      PopularMoviesRequest popularMoviesRequest);

  Future<Either<Failure, PopularMoviesModel>> searchMovie(
      SearchMoviesRequest searchMoviesRequest);

  Future<Either<Failure, Movie>> movieDetails(
      MovieDetailsRequest movieDetailsRequest);
}
