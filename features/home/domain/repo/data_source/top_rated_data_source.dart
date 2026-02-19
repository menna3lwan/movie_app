import '../../../data/movies_response_dto.dart';

abstract class TopRatedDataSource {
  Future<MoviesResponseDto> getTopRatedMovies();
}
