import '../../entity/movie_entity.dart';

abstract class PopularRepo {
  Future<List<MovieEntity>> getPopularMovies();
}
