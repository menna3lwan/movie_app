import 'package:injectable/injectable.dart';
import '../../../../core/network/api_result.dart';
import '../../../../features/details/domain/entity/details_entity.dart';
import '../../../../features/details/domain/repo/repository/details_repo.dart';
@injectable
class GetDetailsUseCase {
  final DetailsRepo _detailsRepo;
  GetDetailsUseCase(this._detailsRepo);
  Future<ApiResult<DetailsEntity>> call(int movieId) async =>
      await _detailsRepo.getMovieDetails(movieId);
}
