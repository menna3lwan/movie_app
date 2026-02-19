import 'package:injectable/injectable.dart';

import '../../domain/entity/movie_entity.dart';
import '../../domain/repo/data_source/popular_data_source.dart';
import '../../domain/repo/repository/popular_repo.dart';

@Injectable(as: PopularRepo)
class PopularRepoImp implements PopularRepo {
  final PopularDataSource _dataSource;

  PopularRepoImp(this._dataSource);

  @override
  Future<List<MovieEntity>> getPopularMovies() async {
    final response = await _dataSource.getPopularMovies();
    return response.toEntities();
  }
}
