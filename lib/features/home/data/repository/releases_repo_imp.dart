import 'package:injectable/injectable.dart';

import '../../../../core/network/api_result.dart';
import '../../domain/entity/movie_entity.dart';
import '../../domain/repo/data_source/releases_data_source.dart';
import '../../domain/repo/repository/releases_repo.dart';

@Injectable(as: ReleasesRepo)
class ReleasesRepoImp implements ReleasesRepo {
  final ReleasesDataSource _dataSource;

  ReleasesRepoImp(this._dataSource);

  @override
  Future<ApiResult<List<MovieEntity>>> getReleasesMovies() =>
      _dataSource.getReleasesMovies();
}
