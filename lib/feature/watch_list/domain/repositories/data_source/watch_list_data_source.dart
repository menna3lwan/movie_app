import 'package:movie_app/feature/watch_list/domain/entity/watch_list_entity.dart';
 
abstract class WatchlistDataSource {
  Future<void> addMovie(WatchlistMovieEntity movie);

  Future<void> removeMovie(int id);

  List<WatchlistMovieEntity> getMovies();

  bool isInWatchlist(int id);
}
