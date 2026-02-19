import '../../../data/movies_response_dto.dart';

abstract class PopularDataSource {
  Future<MoviesResponseDto> getPopularMovies();
}
