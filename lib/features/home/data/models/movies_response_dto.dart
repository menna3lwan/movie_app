import 'package:movie_app/features/home/data/models/movie_dto.dart';

class MoviesResponseDto {
  final int page;
  final List<MovieDto> results;
  final int totalPages;
  final int totalResults;

  MoviesResponseDto({
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
}
