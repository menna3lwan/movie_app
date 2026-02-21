import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/features/details/data/api/similar_api.dart';
import 'package:movie_app/features/details/data/models/similar_dto.dart';
import 'package:movie_app/features/details/domain/entity/similar_entity.dart';
import 'package:movie_app/features/details/domain/repo/data_source/similar_data_source.dart';
@Injectable(as: SimilarDataSource)
class SimilarDataSourceImp implements SimilarDataSource {
  SimilarDataSourceImp(this._similarApi);
  final SimilarApi _similarApi;
  
  @override
  Future<ApiResult<SimilarEntity>> getMovieSimilars(int movieId) async {
    final result = await _similarApi.getMovieSimilars(movieId);
    switch (result) {
      case ApiSuccess<SimilarDto>():
        final resultDto = result.data;
        final resultEntity = resultDto.toEntity();
        return ApiSuccess<SimilarEntity>( resultEntity);
      case ApiFailure<SimilarDto>():
        return ApiFailure<SimilarEntity>(result.message);
    }
  }
  
}
