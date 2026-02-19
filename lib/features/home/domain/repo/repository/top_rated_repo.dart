import '../../../../../core/network/api_result.dart';
import '../../entity/movie_entity.dart';

abstract class TopRatedRepo {
  Future<ApiResult<List<MovieEntity>>> getTopRatedMovies();
}
