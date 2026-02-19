import 'package:injectable/injectable.dart';

import '../../domain/repo/data_source/top_rated_data_source.dart';
import '../movies_response_dto.dart';
import '../top_rated_api.dart';

@Injectable(as: TopRatedDataSource)
class TopRatedDataSourceImp implements TopRatedDataSource {
  @override
  Future<MoviesResponseDto> getTopRatedMovies() {
    return TopRatedApi.getTopRatedMovies();
  }
}
