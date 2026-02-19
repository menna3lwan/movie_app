import 'package:injectable/injectable.dart';

import '../../../../core/network/api_result.dart';
import '../entity/movie_entity.dart';
import '../repo/repository/releases_repo.dart';

@injectable
class GetReleasesUseCase {
  final ReleasesRepo _repo;

  GetReleasesUseCase(this._repo);

  Future<ApiResult<List<MovieEntity>>> call() async =>
      await _repo.getReleasesMovies();
}
