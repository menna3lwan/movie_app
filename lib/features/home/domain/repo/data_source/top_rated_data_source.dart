import '../../../../../core/network/api_result.dart';
import '../../entity/movie_entity.dart';

abstract class TopRatedDataSource {
  Future<ApiResult<List<MovieEntity>>> getTopRatedMovies();
}
