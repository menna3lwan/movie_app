import '../../../../../core/network/api_result.dart';
import '../../entity/movie_entity.dart';

abstract class PopularDataSource {
  Future<ApiResult<List<MovieEntity>>> getPopularMovies();
}
