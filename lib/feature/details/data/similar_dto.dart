import 'package:movie_app/feature/details/data/details_dto.dart';
import 'package:movie_app/feature/details/domain/entity/similar_entity.dart';

class SimilarDto {
  final int page;
  final List<DetailsDto> results;
  final int totalPages;
  final int totalResults;

  SimilarDto({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SimilarDto.fromJson(Map<String, dynamic> json) {
    return SimilarDto(
      page: json['page'] ?? 1,
      results: (json['results'] as List? ?? [])
          .map((e) => DetailsDto.fromJson(e))
          .toList(),
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }
  SimilarEntity toEntity() {
    return SimilarEntity(
      page: page,
      results: results.map((e) => e.toEntity()).toList(),
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }
}
