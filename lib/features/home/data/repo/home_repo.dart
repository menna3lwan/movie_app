import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/features/home/data/data_source/now_playing_api.dart';
import 'package:movie_app/features/home/data/data_source/popular_api.dart';
import 'package:movie_app/features/home/data/data_source/top_rated_api.dart';
import 'package:movie_app/features/home/data/models/movies_response_dto.dart';

class HomeRepo {
  static Future<ApiResult<MoviesResponseDto>> getNowPlayingMovies() {
    return NowPlayingApi.getNowPlayingMovies();
  }

  static Future<ApiResult<MoviesResponseDto>> getPopularMovies() {
    return PopularApi.getPopularMovies();
  }

  static Future<ApiResult<MoviesResponseDto>> getTopRatedMovies() {
    return TopRatedApi.getTopRatedMovies();
  }
}
