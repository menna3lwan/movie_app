import 'package:injectable/injectable.dart';
import 'package:movie_app/features/watch_list/domain/entity/watch_list_entity.dart';
import 'package:movie_app/features/watch_list/domain/repositories/repo/watch_list_repo.dart';

@injectable
class GetWatchlistUseCase {
  GetWatchlistUseCase(this._repo);
  final WatchlistRepo _repo;

  List<WatchlistMovieEntity> call() {
    return _repo.getWatchlist();
  }
}
