import 'package:injectable/injectable.dart';

import '../../domain/repo/data_source/popular_data_source.dart';
import '../movies_response_dto.dart';
import '../popular_api.dart';

@Injectable(as: PopularDataSource)
class PopularDataSourceImp implements PopularDataSource {
  @override
  Future<MoviesResponseDto> getPopularMovies() {
    return PopularApi.getPopularMovies();
  }
}
