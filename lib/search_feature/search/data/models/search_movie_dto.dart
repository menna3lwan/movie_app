import 'package:movie_app/search_feature/search/domain/entity/movie_entity.dart';

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
      // Note: Mapping snake_case JSON keys to camelCase Dart variables
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
  String? original_title;
  String? overview;
  String? release_date;
  String? original_language;
  double? popularity;
  double? vote_average;
  int? vote_count;
  String? poster_path;
  String? backdrop_path;
  bool? adult;
  bool? video;
  List<int>? genre_ids;

  MovieDto({
    this.id,
    this.title,
    this.original_title,
    this.overview,
    this.release_date,
    this.original_language,
    this.popularity,
    this.vote_average,
    this.vote_count,
    this.poster_path,
    this.backdrop_path,
    this.adult,
    this.video,
    this.genre_ids,
  });

  factory MovieDto.fromJson(Map<String, dynamic> json) {
    return MovieDto(
      id: json['id'],
      title: json['title'],
      original_title: json['original_title'],
      overview: json['overview'],
      release_date: json['release_date'],
      original_language: json['original_language'],
      // 'num?' allows parsing whether the API sends 7 (int) or 7.5 (double)
      popularity: (json['popularity'] as num?)?.toDouble(),
      vote_average: (json['vote_average'] as num?)?.toDouble(),
      vote_count: json['vote_count'],
      poster_path: json['poster_path'],
      backdrop_path: json['backdrop_path'],
      adult: json['adult'],
      video: json['video'],
      // Safely casting List<dynamic> to List<int>
      genre_ids: json['genre_ids'] != null 
          ? List<int>.from(json['genre_ids']) 
          : null,
    );
  }

  SearchEntity toEntity() {
    return SearchEntity(
      id: id ?? 0,
      title: title ?? '',
      originalTitle: original_title ?? '',
      overview: overview ?? '',
      releaseDate: release_date ?? '',
      originalLanguage: original_language ?? '',
      popularity: popularity ?? 0.0,
      voteAverage: vote_average?.toDouble() ?? 0.0,
      voteCount: vote_count ?? 0,
      posterPath: poster_path ?? '',
      backdropPath: backdrop_path ?? '',
      adult: adult ?? false,
      video: video ?? false,
      genreIds: genre_ids ?? [],
    );
  }
}