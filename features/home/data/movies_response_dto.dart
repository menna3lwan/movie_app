import 'package:flutter/foundation.dart';

import '../domain/entity/movie_entity.dart';
import 'movie_dto.dart';

@immutable
class MoviesResponseDto {
  final int page;
  final List<MovieDto> results;
  final int totalPages;
  final int totalResults;

  const MoviesResponseDto({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MoviesResponseDto.fromJson(Map<String, dynamic> json) {
    return MoviesResponseDto(
      page: json['page'] ?? 1,
      results: (json['results'] as List? ?? [])
          .map((e) => MovieDto.fromJson(e))
          .toList(),
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }

  List<MovieEntity> toEntities() {
    return results.map((e) => e.toEntity()).toList();
  }
}
