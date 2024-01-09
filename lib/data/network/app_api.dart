import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../app/constants.dart';
import '../response/responses.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(Endpoints.login)
  Future<BaseResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );

  @POST(Endpoints.registration)
  @MultiPart()
  Future<BaseResponse> registration(
    @Part(name: "first_name") String firstName,
    @Part(name: "last_name") String lastName,
    @Part(name: "about") String about,
    @Part(name: "tags[]") List<String> tags,
    @Part(name: "favorite_social_media[]") List<String> favorite_social_media,
    @Part(name: "salary") String salary,
    @Part(name: "password") String password,
    @Part(name: "email") String email,
    @Part(name: "birth_date") String birthDate,
    @Part(name: "gender") String gender,
    @Part(name: "type") String typeId,
    @Part(name: "password_confirmation") String passwordConfirmation,
    @Part(name: "avatar") File avatar,
  );

  @GET(Endpoints.countries)
  Future<BaseResponse> countries();

  @GET(Endpoints.whoAmI)
  Future<BaseResponse> whoAmIData();

  @GET(Endpoints.lookups)
  Future<BaseResponse> lookupsData();

  @GET(Endpoints.services)
  Future<BaseResponse> services();

  @GET(Endpoints.popularServices)
  Future<BaseResponse> popularServices();
}
