import 'package:dartz/dartz.dart';
import 'package:victory_link_movies/domain/model/popular_movies_model.dart';
import 'package:victory_link_movies/domain/requests/popular_movies_request.dart';

import '../../data/network/failure.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class PopularMoviesUseCase
    implements BaseUseCase<PopularMoviesInput, PopularMoviesModel> {
  final Repository _repository;

  PopularMoviesUseCase(this._repository);

  @override
  Future<Either<Failure, PopularMoviesModel>> execute(PopularMoviesInput input) async {
    return await _repository.getPopularMovies(input.popularMoviesRequest);
  }
}

class PopularMoviesInput {
  PopularMoviesRequest popularMoviesRequest;

  PopularMoviesInput(this.popularMoviesRequest);
}
