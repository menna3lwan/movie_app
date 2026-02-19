import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/details/domain/entity/similar_entity.dart';
import 'package:movie_app/feature/details/domain/repo/data_source/similar_data_source.dart';
import 'package:movie_app/feature/details/domain/repo/repository/similar_repo.dart';
@Injectable(as: SimilarRepo)
class SimilarRepoImp implements SimilarRepo{
  SimilarRepoImp(this._similarDataSource);
  SimilarDataSource _similarDataSource;
  @override
  Future<ApiResult<SimilarEntity>> getMovieSimilars(int movieId) => _similarDataSource.getMovieSimilars(movieId);
}