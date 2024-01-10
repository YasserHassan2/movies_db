import 'package:floor/floor.dart';

@entity
class MovieEntity {
  @primaryKey
  final int id;
  final String imageUrl;
  final String title;
  final String overView;

  MovieEntity(this.id, this.imageUrl, this.title, this.overView);
}
