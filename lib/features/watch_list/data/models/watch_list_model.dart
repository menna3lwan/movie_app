import 'package:hive/hive.dart';
import 'package:movie_app/features/watch_list/domain/entity/watch_list_entity.dart';
part 'watch_list_model.g.dart';

@HiveType(typeId: 3)
class WatchlistMovieModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String posterPath;

  @HiveField(3)
  final double voteAverage;

  @HiveField(4)
  final String releaseDate;

  @HiveField(5)
  final List<String> genres;

  @HiveField(6)
  final int runtime;

  const WatchlistMovieModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.genres,
    required this.runtime,
  });

  factory WatchlistMovieModel.fromEntity(WatchlistMovieEntity entity) {
    return WatchlistMovieModel(
      id: entity.id,
      title: entity.title,
      posterPath: entity.posterPath,
      voteAverage: entity.voteAverage,
      releaseDate: entity.releaseDate,
      genres: entity.genres,
      runtime: entity.runtime,
    );
  }

  WatchlistMovieEntity toEntity() {
    return WatchlistMovieEntity(
      id: id,
      title: title,
      posterPath: posterPath,
      voteAverage: voteAverage,
      releaseDate: releaseDate,
      genres: genres,
      runtime: runtime,
    );
  }
}
