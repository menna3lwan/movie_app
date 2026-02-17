import 'package:injectable/injectable.dart';
import 'package:movie_app/feature/watch_list/domain/entity/watch_list_entity.dart';
import 'package:movie_app/feature/watch_list/domain/repositories/repo/watch_list_repo.dart';

@injectable
class AddToWatchlistUseCase {
  AddToWatchlistUseCase(this._repo);
  final WatchlistRepo _repo;

  Future<void> call(WatchlistMovieEntity movie) {
    return _repo.addToWatchlist(movie);
  }
}
