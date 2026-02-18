import 'package:movie_app/features/home/domain/entities/movie_entity.dart';

class MovieDto {
  final int id;
  final String? title;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final String? releaseDate;
  final String? overview;
  final List<int> genreIds;

  MovieDto({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.overview,
    required this.genreIds,
  });

  factory MovieDto.fromJson(Map<String, dynamic> json) {
    return MovieDto(
      id: json['id'] ?? 0,
      title: json['title'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      releaseDate: json['release_date'],
      overview: json['overview'],
      genreIds: (json['genre_ids'] as List? ?? [])
          .map((e) => (e as num).toInt())
          .toList(),
    );
  }

  MovieEntity toEntity() {
    return MovieEntity(
      id: id,
      title: title ?? '',
      posterPath: posterPath,
      backdropPath: backdropPath,
      voteAverage: voteAverage,
      releaseDate: releaseDate ?? '',
      overview: overview ?? '',
      genreIds: genreIds,
    );
  }
}
