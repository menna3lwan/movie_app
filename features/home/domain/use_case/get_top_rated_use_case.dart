import 'package:injectable/injectable.dart';

import '../entity/movie_entity.dart';
import '../repo/repository/top_rated_repo.dart';

@injectable
class GetTopRatedUseCase {
  final TopRatedRepo _repo;

  GetTopRatedUseCase(this._repo);

  Future<List<MovieEntity>> call() {
    return _repo.getTopRatedMovies();
  }
}
