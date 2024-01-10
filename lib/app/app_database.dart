// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:victory_link_movies/domain/database_entities/movie_entity.dart';

import '../data/dao/movies_dao.dart';
part 'app_database.g.dart';

@Database(version: 1, entities: [MovieEntity])
abstract class AppDatabase extends FloorDatabase {
  MoviesDao get moviesDao;
}
