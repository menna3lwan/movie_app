// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/data/data_source/popular_data_source_imp.dart'
    as _i316;
import '../../features/home/data/data_source/releases_data_source_imp.dart'
    as _i598;
import '../../features/home/data/data_source/top_rated_data_source_imp.dart'
    as _i963;
import '../../features/home/data/popular_api.dart' as _i934;
import '../../features/home/data/releases_api.dart' as _i310;
import '../../features/home/data/repository/popular_repo_imp.dart' as _i634;
import '../../features/home/data/repository/releases_repo_imp.dart' as _i400;
import '../../features/home/data/repository/top_rated_repo_imp.dart' as _i939;
import '../../features/home/data/top_rated_api.dart' as _i828;
import '../../features/home/domain/repo/data_source/popular_data_source.dart'
    as _i373;
import '../../features/home/domain/repo/data_source/releases_data_source.dart'
    as _i102;
import '../../features/home/domain/repo/data_source/top_rated_data_source.dart'
    as _i713;
import '../../features/home/domain/repo/repository/popular_repo.dart' as _i944;
import '../../features/home/domain/repo/repository/releases_repo.dart' as _i526;
import '../../features/home/domain/repo/repository/top_rated_repo.dart' as _i50;
import '../../features/home/domain/use_case/get_popular_use_case.dart' as _i19;
import '../../features/home/domain/use_case/get_releases_use_case.dart' as _i13;
import '../../features/home/domain/use_case/get_top_rated_use_case.dart'
    as _i274;
import '../../features/home/presentation/view_model/home_provider.dart'
    as _i713;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i934.PopularApi>(() => _i934.PopularApi());
    gh.factory<_i310.ReleasesApi>(() => _i310.ReleasesApi());
    gh.factory<_i828.TopRatedApi>(() => _i828.TopRatedApi());
    gh.factory<_i713.TopRatedDataSource>(() => _i963.TopRatedDataSourceImp());
    gh.factory<_i102.ReleasesDataSource>(() => _i598.ReleasesDataSourceImp());
    gh.factory<_i373.PopularDataSource>(() => _i316.PopularDataSourceImp());
    gh.factory<_i50.TopRatedRepo>(
      () => _i939.TopRatedRepoImp(gh<_i713.TopRatedDataSource>()),
    );
    gh.factory<_i274.GetTopRatedUseCase>(
      () => _i274.GetTopRatedUseCase(gh<_i50.TopRatedRepo>()),
    );
    gh.factory<_i526.ReleasesRepo>(
      () => _i400.ReleasesRepoImp(gh<_i102.ReleasesDataSource>()),
    );
    gh.factory<_i944.PopularRepo>(
      () => _i634.PopularRepoImp(gh<_i373.PopularDataSource>()),
    );
    gh.factory<_i13.GetReleasesUseCase>(
      () => _i13.GetReleasesUseCase(gh<_i526.ReleasesRepo>()),
    );
    gh.factory<_i19.GetPopularUseCase>(
      () => _i19.GetPopularUseCase(gh<_i944.PopularRepo>()),
    );
    gh.factory<_i713.HomeProvider>(
      () => _i713.HomeProvider(
        gh<_i274.GetTopRatedUseCase>(),
        gh<_i19.GetPopularUseCase>(),
        gh<_i13.GetReleasesUseCase>(),
      ),
    );
    return this;
  }
}
