import 'package:injectable/injectable.dart';
<<<<<<< HEAD:lib/features/details/domain/use_case/get_details_use_case.dart
import '../../../../core/network/api_result.dart';
import '../../../../features/details/domain/entity/details_entity.dart';
import '../../../../features/details/domain/repo/repository/details_repo.dart';
=======
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/details/domain/entity/details_entity.dart';
import 'package:movie_app/feature/details/domain/repo/repository/details_repo.dart';
>>>>>>> df95b67d114e919723fb677e6bafe9b35ef78d93:lib/feature/details/domain/use_case/get_details_use_case.dart
@injectable
class GetDetailsUseCase {
  final DetailsRepo _detailsRepo;
  GetDetailsUseCase(this._detailsRepo);
  Future<ApiResult<DetailsEntity>> call(int movieId) async =>
      await _detailsRepo.getMovieDetails(movieId);
}
