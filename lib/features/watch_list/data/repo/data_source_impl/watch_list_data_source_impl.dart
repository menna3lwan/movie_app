
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/features/watch_list/data/models/watch_list_model.dart';
import 'package:movie_app/features/watch_list/domain/entity/watch_list_entity.dart';
import 'package:movie_app/features/watch_list/domain/repositories/data_source/watch_list_data_source.dart';

@Injectable(as: WatchlistDataSource)
class WatchlistDataSourceImpl implements WatchlistDataSource {
  final Box<WatchlistMovieModel> box;

  WatchlistDataSourceImpl(this.box);

  @override
  Future<void> addMovie(WatchlistMovieEntity movie) {
    return box.put(movie.id, WatchlistMovieModel.fromEntity(movie));
  }

  @override
  Future<void> removeMovie(int id) {
    return box.delete(id);
  }

  @override
  List<WatchlistMovieEntity> getMovies() {
    return box.values.map((e) => e.toEntity()).toList();
  }

  @override
  bool isInWatchlist(int id) {
    return box.containsKey(id);
  }
}
