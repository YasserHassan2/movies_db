import 'dart:core';
import 'dart:core';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:victory_link_movies/domain/model/popular_movies_model.dart';

import '../../app/constants.dart';
import '../response/responses.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET(Endpoints.popularMovies)
  Future<PopularMoviesModel> popularMovies(
    @Query('page') int page,
    @Query('language') String language,
  );

  @GET(Endpoints.searchMovies)
  Future<PopularMoviesModel> searchMovies(
    @Query('query') String query,
    @Query('api_key') String api_key,
  );

  @GET("${Endpoints.movieDetails}{movieId}")
  Future<dynamic> movieDetails(
    @Path('movieId') String movieId,
    @Query('api_key') String api_key,
  );
}
