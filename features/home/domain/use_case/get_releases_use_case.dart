import 'package:injectable/injectable.dart';

import '../entity/movie_entity.dart';
import '../repo/repository/releases_repo.dart';

@injectable
class GetReleasesUseCase {
  final ReleasesRepo _repo;

  GetReleasesUseCase(this._repo);

  Future<List<MovieEntity>> call() {
    return _repo.getReleasesMovies();
  }
}
