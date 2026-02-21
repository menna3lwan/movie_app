import 'package:injectable/injectable.dart';
import '../../../../../core/network/api_result.dart';
import '../../../domain/entity/movie_entity.dart';
import '../../../domain/repo/data_source/top_rated_data_source.dart';
import '../../models/movies_response_dto.dart';
import '../../API/top_rated_api.dart';

@Injectable(as: TopRatedDataSource)
class TopRatedDataSourceImp implements TopRatedDataSource {
  final TopRatedApi _topRatedApi;

  TopRatedDataSourceImp(this._topRatedApi);

  @override
  Future<ApiResult<List<MovieEntity>>> getTopRatedMovies() async {
    final result = await _topRatedApi.getTopRatedMovies();
    switch (result) {
      case ApiSuccess<MoviesResponseDto>():
        return ApiSuccess<List<MovieEntity>>(result.data.toEntities());
      case ApiFailure<MoviesResponseDto>():
        return ApiFailure<List<MovieEntity>>(result.message);
    }
  }
}
