import 'dart:math';

import 'package:victory_link_movies/domain/model/popular_movies_model.dart';
import 'package:victory_link_movies/presentation/main/bloc/main_bloc.dart';

import '../../domain/requests/popular_movies_request.dart';
import '../network/app_api.dart';
import '../response/responses.dart';

abstract class RemoteDataSource {
  Future<PopularMoviesModel> getPopularMovies(
      PopularMoviesRequest popularMoviesRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<PopularMoviesModel> getPopularMovies(
      PopularMoviesRequest popularMoviesRequest) async {
    return await _appServiceClient.popularMovies(
        popularMoviesRequest.pageNumber, popularMoviesRequest.lang);
  }
}
