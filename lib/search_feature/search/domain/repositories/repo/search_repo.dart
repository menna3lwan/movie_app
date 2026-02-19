import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/search_feature/search/domain/entity/movie_entity.dart';

abstract class SearchRepo {
 Future<ApiResult<List<SearchEntity>>>  searchMovies(String query);
}