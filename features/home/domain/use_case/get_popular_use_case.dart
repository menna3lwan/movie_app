import 'package:injectable/injectable.dart';

import '../entity/movie_entity.dart';
import '../repo/repository/popular_repo.dart';

@injectable
class GetPopularUseCase {
  final PopularRepo _repo;

  GetPopularUseCase(this._repo);

  Future<List<MovieEntity>> call() {
    return _repo.getPopularMovies();
  }
}
