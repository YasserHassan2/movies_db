import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:victory_link_movies/domain/usecase/movie_details_usecase.dart';
import 'package:victory_link_movies/domain/usecase/popular_movies_usecase.dart';
import 'package:victory_link_movies/domain/usecase/search_movies_usecase.dart';

import '../data/data_source/local_data_source.dart';
import '../data/data_source/remote_data_source.dart';
import '../data/network/app_api.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repository/repository.dart';
import 'app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies

  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();
  //app service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance<AppServiceClient>()));

  // local data source
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  // repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance(), instance()));
}

initMainModule() {
  if (!GetIt.I.isRegistered<PopularMoviesUseCase>()) {
    instance.registerFactory<PopularMoviesUseCase>(
        () => PopularMoviesUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<SearchMoviesUseCase>()) {
    instance.registerFactory<SearchMoviesUseCase>(
        () => SearchMoviesUseCase(instance()));
  }
}

initMovieDetailsModule() {
  if (!GetIt.I.isRegistered<MovieDetailsUseCase>()) {
    instance.registerFactory<MovieDetailsUseCase>(
        () => MovieDetailsUseCase(instance()));
  }
}
