import 'package:injectable/injectable.dart';

import '../../../../core/network/api_result.dart';
import '../../domain/entity/movie_entity.dart';
import '../../domain/repo/data_source/releases_data_source.dart';
import '../movies_response_dto.dart';
import '../releases_api.dart';

@Injectable(as: ReleasesDataSource)
class ReleasesDataSourceImp implements ReleasesDataSource {
  final ReleasesApi _releasesApi;

  ReleasesDataSourceImp(this._releasesApi);

  @override
  Future<ApiResult<List<MovieEntity>>> getReleasesMovies() async {
    final result = await _releasesApi.getReleasesMovies();
    switch (result) {
      case ApiSuccess<MoviesResponseDto>():
        return ApiSuccess<List<MovieEntity>>(result.data.toEntities());
      case ApiFailure<MoviesResponseDto>():
        return ApiFailure<List<MovieEntity>>(result.message);
    }
  }
}
