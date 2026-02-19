import '../../../../../core/network/api_result.dart';
import '../../../../../features/details/domain/entity/similar_entity.dart';

abstract class SimilarDataSource {
  Future<ApiResult<SimilarEntity>> getMovieSimilars(int movieId);
}
