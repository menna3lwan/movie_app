<<<<<<< HEAD:lib/features/details/domain/repo/data_source/details_data_source.dart
 import '../../../../../core/network/api_result.dart';
import '../../../../details/domain/entity/details_entity.dart';
=======
 import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/details/domain/entity/details_entity.dart';
>>>>>>> df95b67d114e919723fb677e6bafe9b35ef78d93:lib/feature/details/domain/repo/data_source/details_data_source.dart

abstract class DetailsDataSource {
 Future<ApiResult<DetailsEntity>> getMovieDetails(int movieId) ;
}