 import '../../../../../core/network/api_result.dart';
import '../../../../details/domain/entity/details_entity.dart';

abstract class DetailsDataSource {
 Future<ApiResult<DetailsEntity>> getMovieDetails(int movieId) ;
}