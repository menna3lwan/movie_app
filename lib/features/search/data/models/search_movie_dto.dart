import 'package:movie_app/features/search/domain/entity/movie_entity.dart';

class SearchResponseDto {
  int? page;
  List<MovieDto>? results;
  int? totalPages;
  int? totalResults;

  SearchResponseDto({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory SearchResponseDto.fromJson(Map<String, dynamic> json) {
    return SearchResponseDto(
      page: json['page'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  List<SearchEntity> toEntityList() {
    return results?.map((dto) => dto.toEntity()).toList() ?? [];
  }
}

class MovieDto {
  int? id;
  String? title;
  String? originalTitle;
  String? overview;
  String? releaseDate;
  String? originalLanguage;
  double? popularity;
  double? voteAverage;
  int? voteCount;
  String? posterPath;
  String? backdropPath;
  bool? adult;
  bool? video;
  List<int>? genreIds;

  MovieDto({
    this.id,
    this.title,
    this.originalTitle,
    this.overview,
    this.releaseDate,
    this.originalLanguage,
    this.popularity,
    this.voteAverage,
    this.voteCount,
    this.posterPath,
    this.backdropPath,
    this.adult,
    this.video,
    this.genreIds,
  });

  factory MovieDto.fromJson(Map<String, dynamic> json) {
    return MovieDto(
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      originalLanguage: json['original_language'],
      popularity: (json['popularity'] as num?)?.toDouble(),
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      adult: json['adult'],
      video: json['video'],
      genreIds:
          json['genre_ids'] != null ? List<int>.from(json['genre_ids']) : null,
    );
  }

  SearchEntity toEntity() {
    return SearchEntity(
      id: id ?? 0,
      title: title ?? '',
      originalTitle: originalTitle ?? '',
      overview: overview ?? '',
      releaseDate: releaseDate ?? '',
      originalLanguage: originalLanguage ?? '',
      popularity: popularity ?? 0.0,
      voteAverage: voteAverage?.toDouble() ?? 0.0,
      voteCount: voteCount ?? 0,
      posterPath: posterPath ?? '',
      backdropPath: backdropPath ?? '',
      adult: adult ?? false,
      video: video ?? false,
      genreIds: genreIds ?? [],
    );
  }
}
