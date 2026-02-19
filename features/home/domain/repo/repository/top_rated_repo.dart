import '../../entity/movie_entity.dart';

abstract class TopRatedRepo {
  Future<List<MovieEntity>> getTopRatedMovies();
}
