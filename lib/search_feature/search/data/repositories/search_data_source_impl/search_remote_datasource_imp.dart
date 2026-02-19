import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/search_feature/search/data/SearchApi/search_api.dart';
import 'package:movie_app/search_feature/search/data/models/search_movie_dto.dart';
import 'package:movie_app/search_feature/search/domain/entity/movie_entity.dart';
import 'package:movie_app/search_feature/search/domain/repositories/datasource/search_remote_datasource.dart';


@Injectable(as: SearchRemoteDataSource)
class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final SearchApi _searchApi;

  SearchRemoteDataSourceImpl(this._searchApi);
  @override
Future<ApiResult<List<SearchEntity>>> searchMovies(String query) async {
  final result = await _searchApi.searchMovies(query);

  switch (result) {
    case ApiSuccess<SearchResponseDto>():
      final responseDto = result.data;

      final entityList = responseDto.results
          !.map((movieDto) => movieDto.toEntity())
          .toList();

      return ApiSuccess<List<SearchEntity>>(entityList);

    case ApiFailure<SearchResponseDto>():
      return ApiFailure<List<SearchEntity>>(result.message);
  }
}

}
