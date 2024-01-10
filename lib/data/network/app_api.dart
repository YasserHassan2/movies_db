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
    @Field("page") int pageNumber,
    @Field("language") String language,
  );

}
