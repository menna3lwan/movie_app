import '../../../data/movies_response_dto.dart';

abstract class ReleasesDataSource {
  Future<MoviesResponseDto> getReleasesMovies();
}
