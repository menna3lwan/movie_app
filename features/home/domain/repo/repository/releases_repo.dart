import '../../entity/movie_entity.dart';

abstract class ReleasesRepo {
  Future<List<MovieEntity>> getReleasesMovies();
}
