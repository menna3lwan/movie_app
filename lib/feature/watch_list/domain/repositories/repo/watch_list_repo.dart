import 'package:movie_app/feature/watch_list/domain/entity/watch_list_entity.dart';

abstract class WatchlistRepo {
  Future<void> addToWatchlist(WatchlistMovieEntity movie);

  Future<void> removeFromWatchlist(int id);

  List<WatchlistMovieEntity> getWatchlist();

  bool isInWatchlist(int id);
}
