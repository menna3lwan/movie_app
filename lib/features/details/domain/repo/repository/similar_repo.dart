import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/features/details/domain/entity/similar_entity.dart';

abstract class SimilarRepo {
  Future<ApiResult<SimilarEntity>> getMovieSimilars(int movieId);
}
