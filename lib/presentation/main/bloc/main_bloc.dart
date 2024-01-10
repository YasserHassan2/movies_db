import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:victory_link_movies/domain/requests/popular_movies_request.dart';
import 'package:victory_link_movies/domain/usecase/popular_movies_usecase.dart';

import '../../../app/di.dart';
import '../../../domain/model/popular_movies_model.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<getPopularMovies>(_getPopularMovies);
  }

  FutureOr<void> _getPopularMovies(
      getPopularMovies event, Emitter<MainState> emit) async {
    emit(MainLoading());
    PopularMoviesUseCase popularMoviesUseCase =
        instance<PopularMoviesUseCase>();

    (await popularMoviesUseCase.execute(PopularMoviesInput(
            PopularMoviesRequest(event.pageNumber, "en-US"))))
        .fold(
            (failure) => {
                  // left -> failure
                  //emit failure state
                  emit(MainFailure(
                      failure.message.toString(), failure.code.toString()))
                }, (popularMoviesModel) async {
      // right -> data (success)
      // content
      // emit success state
      emit(MainSuccess(popularMoviesModel));
    });
  }
}
