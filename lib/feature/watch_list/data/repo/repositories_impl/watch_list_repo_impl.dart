
import 'package:injectable/injectable.dart';
import 'package:movie_app/feature/watch_list/domain/entity/watch_list_entity.dart';
import 'package:movie_app/feature/watch_list/domain/repositories/data_source/watch_list_data_source.dart';
import 'package:movie_app/feature/watch_list/domain/repositories/repo/watch_list_repo.dart';

@Injectable(as: WatchlistRepo)
class WatchlistRepoImpl implements WatchlistRepo {
  final WatchlistDataSource dataSource;

  WatchlistRepoImpl(this.dataSource);

  @override
  Future<void> addToWatchlist(WatchlistMovieEntity movie) {
    return dataSource.addMovie(movie);
  }

  @override
  Future<void> removeFromWatchlist(int id) {
    return dataSource.removeMovie(id);
  }

  @override
  List<WatchlistMovieEntity> getWatchlist() {
    return dataSource.getMovies();
  }

  @override
  bool isInWatchlist(int id) {
    return dataSource.isInWatchlist(id);
  }
}
