<<<<<<< HEAD:lib/features/details/domain/repo/repository/similar_repo.dart
import '../../../../../core/network/api_result.dart';
import '../../../../../features/details/domain/entity/similar_entity.dart';
=======
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/details/domain/entity/similar_entity.dart';
>>>>>>> df95b67d114e919723fb677e6bafe9b35ef78d93:lib/feature/details/domain/repo/repository/similar_repo.dart

abstract class SimilarRepo {
  Future<ApiResult<SimilarEntity>> getMovieSimilars(int movieId);
}
