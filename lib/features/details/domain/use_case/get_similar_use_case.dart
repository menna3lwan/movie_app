
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/features/details/domain/entity/similar_entity.dart';
import 'package:movie_app/features/details/domain/repo/repository/similar_repo.dart';
@injectable
class GetSimilarUseCase {
  final SimilarRepo _similarRepo;
  GetSimilarUseCase(this._similarRepo);
  Future<ApiResult<SimilarEntity>> call(int movieId) async =>
      await _similarRepo.getMovieSimilars(movieId);
}
