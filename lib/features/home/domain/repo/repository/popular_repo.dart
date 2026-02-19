import '../../../../../core/network/api_result.dart';
import '../../entity/movie_entity.dart';

abstract class PopularRepo {
  Future<ApiResult<List<MovieEntity>>> getPopularMovies();
}
