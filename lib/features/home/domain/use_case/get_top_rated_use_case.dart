import 'package:injectable/injectable.dart';

import '../../../../core/network/api_result.dart';
import '../entity/movie_entity.dart';
import '../repo/repository/top_rated_repo.dart';

@injectable
class GetTopRatedUseCase {
  final TopRatedRepo _repo;

  GetTopRatedUseCase(this._repo);

  Future<ApiResult<List<MovieEntity>>> call() async =>
      await _repo.getTopRatedMovies();
}
