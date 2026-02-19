import '../../../../../core/network/api_result.dart';
import '../../../../../features/details/domain/entity/details_entity.dart';

abstract class DetailsRepo {
  Future<ApiResult<DetailsEntity>> getMovieDetails(int movieId);
}
