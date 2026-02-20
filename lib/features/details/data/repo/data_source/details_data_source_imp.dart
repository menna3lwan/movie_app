import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/features/details/data/api/details_api.dart';
import 'package:movie_app/features/details/data/models/details_dto.dart';
import 'package:movie_app/features/details/domain/entity/details_entity.dart';
import 'package:movie_app/features/details/domain/repo/data_source/details_data_source.dart';
@Injectable(as: DetailsDataSource)
class DetailsDataSourceImp implements DetailsDataSource {
  DetailsDataSourceImp(this._detailsApi);
  final DetailsApi _detailsApi;
  @override
  Future<ApiResult<DetailsEntity>> getMovieDetails(int movieId) async {
    final result = await _detailsApi.getMovieDetails(movieId);
    switch (result) {
      case ApiSuccess<DetailsDto>():
        final resultDto = result.data;
        final resultEntity = resultDto.toEntity();
        return ApiSuccess<DetailsEntity>( resultEntity);
      case ApiFailure<DetailsDto>():
        return ApiFailure<DetailsEntity>(result.message);
    }
  }
}
