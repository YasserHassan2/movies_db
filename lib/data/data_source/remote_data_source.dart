

import 'package:victory_link_movies/domain/model/popular_movies_model.dart';
import 'package:victory_link_movies/domain/requests/movie_details_request.dart';
import 'package:victory_link_movies/domain/requests/search_movies_request.dart';

import '../../domain/requests/popular_movies_request.dart';
import '../network/app_api.dart';

abstract class RemoteDataSource {
  Future<PopularMoviesModel> getPopularMovies(
      PopularMoviesRequest popularMoviesRequest);

  Future<PopularMoviesModel> searchMovies(
      SearchMoviesRequest searchMoviesRequest);

  Future<Map<String,dynamic>> movieDetails(MovieDetailsRequest movieDetailsRequest);
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

  @override
  Future<PopularMoviesModel> searchMovies(
      SearchMoviesRequest searchMoviesRequest) async {
    return await _appServiceClient.searchMovies(
        searchMoviesRequest.query, searchMoviesRequest.apiKey);
  }

  @override
  Future<Map<String,dynamic>> movieDetails(MovieDetailsRequest movieDetailsRequest) async {
    return await _appServiceClient.movieDetails(
        movieDetailsRequest.movieId, movieDetailsRequest.apiKey);
  }
}
