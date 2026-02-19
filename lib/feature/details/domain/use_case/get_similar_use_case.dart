
import 'package:injectable/injectable.dart';
<<<<<<< HEAD:lib/features/details/domain/use_case/get_similar_use_case.dart
import '../../../../core/network/api_result.dart';
import '../../../../features/details/domain/entity/similar_entity.dart';
import '../../../../features/details/domain/repo/repository/similar_repo.dart';
=======
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/details/domain/entity/similar_entity.dart';
import 'package:movie_app/feature/details/domain/repo/repository/similar_repo.dart';
>>>>>>> df95b67d114e919723fb677e6bafe9b35ef78d93:lib/feature/details/domain/use_case/get_similar_use_case.dart
@injectable
class GetSimilarUseCase {
  final SimilarRepo _similarRepo;
  GetSimilarUseCase(this._similarRepo);
  Future<ApiResult<SimilarEntity>> call(int movieId) async =>
      await _similarRepo.getMovieSimilars(movieId);
}
