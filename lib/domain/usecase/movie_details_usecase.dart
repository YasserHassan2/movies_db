import 'package:dartz/dartz.dart';
import 'package:victory_link_movies/domain/model/popular_movies_model.dart';
import 'package:victory_link_movies/domain/requests/movie_details_request.dart';

import '../../data/network/failure.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class MovieDetailsUseCase implements BaseUseCase<MovieDetailsInput, Movie> {
  final Repository _repository;

  MovieDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, Movie>> execute(MovieDetailsInput input) async {
    return await _repository.movieDetails(input.movieDetailsRequest);
  }
}

class MovieDetailsInput {
  MovieDetailsRequest movieDetailsRequest;

  MovieDetailsInput(this.movieDetailsRequest);
}
