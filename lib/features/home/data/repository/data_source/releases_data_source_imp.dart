import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/features/home/data/API/releases_api.dart';
import 'package:movie_app/features/home/data/models/movies_response_dto.dart';
import 'package:movie_app/features/home/domain/entity/movie_entity.dart';
import 'package:movie_app/features/home/domain/repo/data_source/releases_data_source.dart';

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
