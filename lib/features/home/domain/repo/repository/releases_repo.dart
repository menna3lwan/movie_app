import '../../../../../core/network/api_result.dart';
import '../../entity/movie_entity.dart';

abstract class ReleasesRepo {
  Future<ApiResult<List<MovieEntity>>> getReleasesMovies();
}
