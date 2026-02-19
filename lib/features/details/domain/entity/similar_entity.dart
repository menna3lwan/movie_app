import 'details_entity.dart';

class SimilarEntity {
  final int page;
  final List<DetailsEntity> results;
  final int totalPages;
  final int totalResults;

  const SimilarEntity({
    this.page = 1,
    this.results = const [],
    this.totalPages = 0,
    this.totalResults = 0,
  });
}
