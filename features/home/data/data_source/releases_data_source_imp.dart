import 'package:injectable/injectable.dart';

import '../../domain/repo/data_source/releases_data_source.dart';
import '../movies_response_dto.dart';
import '../releases_api.dart';

@Injectable(as: ReleasesDataSource)
class ReleasesDataSourceImp implements ReleasesDataSource {
  @override
  Future<MoviesResponseDto> getReleasesMovies() {
    return ReleasesApi.getReleasesMovies();
  }
}
