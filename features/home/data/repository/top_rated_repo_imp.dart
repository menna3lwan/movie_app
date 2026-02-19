import 'package:injectable/injectable.dart';

import '../../domain/entity/movie_entity.dart';
import '../../domain/repo/data_source/top_rated_data_source.dart';
import '../../domain/repo/repository/top_rated_repo.dart';

@Injectable(as: TopRatedRepo)
class TopRatedRepoImp implements TopRatedRepo {
  final TopRatedDataSource _dataSource;

  TopRatedRepoImp(this._dataSource);

  @override
  Future<List<MovieEntity>> getTopRatedMovies() async {
    final response = await _dataSource.getTopRatedMovies();
    return response.toEntities();
  }
}
