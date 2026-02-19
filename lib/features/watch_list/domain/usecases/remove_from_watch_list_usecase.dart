import 'package:injectable/injectable.dart';
import 'package:movie_app/features/watch_list/domain/repositories/repo/watch_list_repo.dart';

@injectable
class RemoveFromWatchlistUseCase {
  RemoveFromWatchlistUseCase(this._repo);
  final WatchlistRepo _repo;

  Future<void> call(int id) {
    return _repo.removeFromWatchlist(id);
  }
}
