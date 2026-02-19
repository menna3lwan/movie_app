import 'package:movie_app/core/network/api_result.dart';

import 'package:movie_app/features/search/domain/entity/movie_entity.dart';


abstract class SearchRemoteDataSource {
Future<ApiResult<List<SearchEntity>>>  searchMovies(String query);
}