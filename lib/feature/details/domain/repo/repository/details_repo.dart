<<<<<<< HEAD:lib/features/details/domain/repo/repository/details_repo.dart
import '../../../../../core/network/api_result.dart';
import '../../../../../features/details/domain/entity/details_entity.dart';
=======
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/details/domain/entity/details_entity.dart';
>>>>>>> df95b67d114e919723fb677e6bafe9b35ef78d93:lib/feature/details/domain/repo/repository/details_repo.dart

abstract class DetailsRepo {
  Future<ApiResult<DetailsEntity>> getMovieDetails(int movieId);
}
