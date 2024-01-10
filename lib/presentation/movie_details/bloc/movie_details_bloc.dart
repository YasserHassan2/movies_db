import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:victory_link_movies/app/constants.dart';
import 'package:victory_link_movies/domain/requests/movie_details_request.dart';
import 'package:victory_link_movies/domain/usecase/movie_details_usecase.dart';

import '../../../app/di.dart';
import '../../../domain/model/popular_movies_model.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc() : super(MovieDetailsInitial()) {
    on<getMovieDetails>(_getMovieDetails);
  }

  FutureOr<void> _getMovieDetails(
      getMovieDetails event, Emitter<MovieDetailsState> emit) async {
    emit(MovieDetailsLoading());
    MovieDetailsUseCase movieDetailsUseCase = instance<MovieDetailsUseCase>();

    (await movieDetailsUseCase.execute(MovieDetailsInput(
            MovieDetailsRequest(event.movieId, Constants.apiKey))))
        .fold(
            (failure) => {
                  // left -> failure
                  //emit failure state
                  emit(MovieDetailsFailure(
                      failure.message.toString(), failure.code.toString()))
                }, (movie) async {
      // right -> data (success)
      // content
      // emit success state
      emit(MovieDetailsSuccess(movie));
    });
  }
}
