import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_result.dart';
import '../../../domain/entity/movie_entity.dart';
import '../../../domain/repo/data_source/popular_data_source.dart';
import '../../models/movies_response_dto.dart';
import '../../API/popular_api.dart';

@Injectable(as: PopularDataSource)
class PopularDataSourceImp implements PopularDataSource {
  final PopularApi _popularApi;

  PopularDataSourceImp(this._popularApi);

  @override
  Future<ApiResult<List<MovieEntity>>> getPopularMovies() async {
    final result = await _popularApi.getPopularMovies();
    switch (result) {
      case ApiSuccess<MoviesResponseDto>():
        return ApiSuccess<List<MovieEntity>>(result.data.toEntities());
      case ApiFailure<MoviesResponseDto>():
        return ApiFailure<List<MovieEntity>>(result.message);
    }
  }
}
