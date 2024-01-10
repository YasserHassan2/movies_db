import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:victory_link_movies/domain/model/popular_movies_model.dart';
import 'package:victory_link_movies/domain/requests/popular_movies_request.dart';

import '../../domain/repository/repository.dart';
import '../data_source/local_data_source.dart';
import '../data_source/remote_data_source.dart';
import '../network/error_handler.dart';
import '../network/failure.dart';
import '../network/network_info.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(
      this._remoteDataSource, this._networkInfo, this._localDataSource);

  @override
  Future<Either<Failure, PopularMoviesModel>> getPopularMovies(
      PopularMoviesRequest popularMoviesRequest) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.getPopularMovies(popularMoviesRequest);

        if (response.success == null || response.success != false) {
          return Right(response);
        } else {
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.statusMessage ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
