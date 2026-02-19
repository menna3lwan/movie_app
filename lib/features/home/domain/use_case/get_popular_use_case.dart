import 'package:injectable/injectable.dart';

import '../../../../core/network/api_result.dart';
import '../entity/movie_entity.dart';
import '../repo/repository/popular_repo.dart';

@injectable
class GetPopularUseCase {
  final PopularRepo _repo;

  GetPopularUseCase(this._repo);

  Future<ApiResult<List<MovieEntity>>> call() async =>
      await _repo.getPopularMovies();
}
