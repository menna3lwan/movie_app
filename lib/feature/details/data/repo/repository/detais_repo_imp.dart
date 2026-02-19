import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/details/domain/entity/details_entity.dart';
import 'package:movie_app/feature/details/domain/repo/data_source/details_data_source.dart';
import 'package:movie_app/feature/details/domain/repo/repository/details_repo.dart';
@Injectable(as:DetailsRepo)
class DetaisRepoImp implements DetailsRepo{
  DetaisRepoImp(this._detailsDataSource);
  DetailsDataSource _detailsDataSource;
  @override
  Future<ApiResult<DetailsEntity>> getMovieDetails(int movieId) => _detailsDataSource.getMovieDetails(movieId);
}