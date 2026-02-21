import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/features/search/domain/entity/movie_entity.dart';
import 'package:movie_app/features/search/domain/repositories/datasource/search_remote_datasource.dart';
import 'package:movie_app/features/search/domain/repositories/repo/search_repo.dart';

@Injectable(as: SearchRepo)
class SearchRepoImpl implements SearchRepo {
  final SearchRemoteDataSource _dataSource;

  SearchRepoImpl(this._dataSource);

  @override
  Future<ApiResult<List<SearchEntity>>> searchMovies(String query) async {
    try {
      final response = await _dataSource.searchMovies(query);
      switch (response) {
        case ApiSuccess<List<SearchEntity>>():
          return ApiSuccess(response.data);
        case ApiFailure<List<SearchEntity>>():
          return ApiFailure(response.message);
      }
    } catch (error) {
      return ApiFailure(error.toString());
    }
  }
}
