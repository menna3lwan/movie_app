import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/features/home/data/data_source/top_rated_api.dart';
import 'package:movie_app/features/home/data/models/movies_response_dto.dart';

class GetTopRatedUseCase {
  static Future<ApiResult<MoviesResponseDto>> call() {
    return TopRatedApi.getTopRatedMovies();
  }
}
