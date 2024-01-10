import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:victory_link_movies/domain/model/popular_movies_model.dart';
import 'package:victory_link_movies/domain/requests/popular_movies_request.dart';
import 'package:victory_link_movies/domain/requests/search_movies_request.dart';

import '../../data/network/failure.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class SearchMoviesUseCase
    implements BaseUseCase<SearchMoviesInput, PopularMoviesModel> {
  final Repository _repository;

  SearchMoviesUseCase(this._repository);

  @override
  Future<Either<Failure, PopularMoviesModel>> execute(SearchMoviesInput input) async {
    return await _repository.searchMovie(input.searchMoviesRequest);
  }
}

class SearchMoviesInput {
  SearchMoviesRequest searchMoviesRequest;

  SearchMoviesInput(this.searchMoviesRequest);
}
