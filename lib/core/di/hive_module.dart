import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/feature/watch_list/data/models/watch_list_model.dart';

@module
abstract class HiveModule {
  @preResolve
  Future<Box<WatchlistMovieModel>> getWatchlistBox() async {
    return await Hive.openBox<WatchlistMovieModel>("watchlist");
  }
}
