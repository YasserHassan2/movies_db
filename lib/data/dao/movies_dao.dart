// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:victory_link_movies/domain/database_entities/movie_entity.dart';

@dao
abstract class MoviesDao {
  @Query('SELECT * FROM Person')
  Future<List<MovieEntity>> findAllMovies();

  @Query('SELECT name FROM Person')
  Stream<List<String>> findAllMoviesName();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<MovieEntity?> findMovieById(int id);

  @insert
  Future<void> insertMovieEntity(MovieEntity person);
}