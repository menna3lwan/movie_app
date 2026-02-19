import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/search_feature/search/domain/entity/movie_entity.dart';
import 'package:movie_app/search_feature/search/domain/repositories/repo/search_repo.dart';
@injectable
class GetSearchMoviesUseCase {
  final SearchRepo _searchRepo;

  GetSearchMoviesUseCase(this._searchRepo);

  Future<ApiResult<List<SearchEntity>>> call(String query) async {
    return await _searchRepo.searchMovies(query);
  }
}