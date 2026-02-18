import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/features/details/domain/entity/details_entity.dart';

abstract class DetailsRepo {
  Future<ApiResult<DetailsEntity>> getMovieDetails(int movieId);
}
