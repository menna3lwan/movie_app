import '../../../../../core/network/api_result.dart';
import '../../entity/movie_entity.dart';

abstract class ReleasesDataSource {
  Future<ApiResult<List<MovieEntity>>> getReleasesMovies();
}
