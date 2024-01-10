

import 'package:dartz/dartz.dart';
import 'package:victory_link_movies/domain/model/popular_movies_model.dart';
import 'package:victory_link_movies/domain/requests/popular_movies_request.dart';
import 'package:victory_link_movies/presentation/main/bloc/main_bloc.dart';

import '../../data/network/failure.dart';

abstract class Repository {

  Future<Either<Failure, PopularMoviesModel>> getPopularMovies(PopularMoviesRequest popularMoviesRequest);
}
