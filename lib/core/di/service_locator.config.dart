// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/details/data/api/details_api.dart' as _i111;
import '../../features/details/data/repo/data_source/details_data_source_imp.dart'
    as _i482;
import '../../features/details/data/repo/data_source/similar_data_source_imp.dart'
    as _i700;
import '../../features/details/data/repo/repository/detais_repo_imp.dart'
    as _i698;
import '../../features/details/data/repo/repository/similar_repo_imp.dart'
    as _i362;
import '../../features/details/data/api/similar_api.dart' as _i489;
import '../../features/details/domain/repo/data_source/details_data_source.dart'
    as _i267;
import '../../features/details/domain/repo/data_source/similar_data_source.dart'
    as _i462;
import '../../features/details/domain/repo/repository/details_repo.dart'
    as _i662;
import '../../features/details/domain/repo/repository/similar_repo.dart'
    as _i436;
import '../../features/details/domain/use_case/get_details_use_case.dart'
    as _i398;
import '../../features/details/domain/use_case/get_similar_use_case.dart'
    as _i160;
import '../../features/details/presentation/view_model/details_cubit.dart'
    as _i262;
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
import '../../features/search/data/repositories/search_data_source_impl/search_remote_datasource_imp.dart'
    as _i663;
import '../../features/search/data/repositories/search_repo_impl/search_repo_impl.dart'
    as _i480;
import '../../features/search/data/SearchApi/search_api.dart' as _i509;
import '../../features/search/domain/repositories/datasource/search_remote_datasource.dart'
    as _i660;
import '../../features/search/domain/repositories/repo/search_repo.dart'
    as _i598;
import '../../features/search/domain/usecases/search_movies_usecase.dart'
    as _i451;
import '../../features/search/presentation/view_model/search_cubit.dart'
    as _i794;
import '../../features/watch_list/data/models/watch_list_model.dart' as _i833;
import '../../features/watch_list/data/repo/data_source_impl/watch_list_data_source_impl.dart'
    as _i402;
import '../../features/watch_list/data/repo/repositories_impl/watch_list_repo_impl.dart'
    as _i8;
import '../../features/watch_list/domain/repositories/data_source/watch_list_data_source.dart'
    as _i81;
import '../../features/watch_list/domain/repositories/repo/watch_list_repo.dart'
    as _i687;
import '../../features/watch_list/domain/usecases/add_to_watch_list_usecase.dart'
    as _i713;
import '../../features/watch_list/domain/usecases/get_watch_list_usecase.dart'
    as _i253;
import '../../features/watch_list/domain/usecases/remove_from_watch_list_usecase.dart'
    as _i765;
import '../../features/watch_list/presentation/view_model/cubit/watch_list_cubit.dart'
    as _i449;
import 'hive_module.dart' as _i576;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final hiveModule = _$HiveModule();
    await gh.factoryAsync<_i979.Box<_i833.WatchlistMovieModel>>(
      () => hiveModule.getWatchlistBox(),
      preResolve: true,
    );
    gh.factory<_i111.DetailsApi>(() => _i111.DetailsApi());
    gh.factory<_i489.SimilarApi>(() => _i489.SimilarApi());
    gh.factory<_i934.PopularApi>(() => _i934.PopularApi());
    gh.factory<_i310.ReleasesApi>(() => _i310.ReleasesApi());
    gh.factory<_i828.TopRatedApi>(() => _i828.TopRatedApi());
    gh.factory<_i509.SearchApi>(() => _i509.SearchApi());
    gh.factory<_i267.DetailsDataSource>(
        () => _i482.DetailsDataSourceImp(gh<_i111.DetailsApi>()));
    gh.factory<_i102.ReleasesDataSource>(
        () => _i598.ReleasesDataSourceImp(gh<_i310.ReleasesApi>()));
    gh.factory<_i713.TopRatedDataSource>(
        () => _i963.TopRatedDataSourceImp(gh<_i828.TopRatedApi>()));
    gh.factory<_i373.PopularDataSource>(
        () => _i316.PopularDataSourceImp(gh<_i934.PopularApi>()));
    gh.factory<_i81.WatchlistDataSource>(() => _i402.WatchlistDataSourceImpl(
        gh<_i979.Box<_i833.WatchlistMovieModel>>()));
    gh.factory<_i660.SearchRemoteDataSource>(
        () => _i663.SearchRemoteDataSourceImpl(gh<_i509.SearchApi>()));
    gh.factory<_i944.PopularRepo>(
        () => _i634.PopularRepoImp(gh<_i373.PopularDataSource>()));
    gh.factory<_i598.SearchRepo>(
        () => _i480.SearchRepoImpl(gh<_i660.SearchRemoteDataSource>()));
    gh.factory<_i526.ReleasesRepo>(
        () => _i400.ReleasesRepoImp(gh<_i102.ReleasesDataSource>()));
    gh.factory<_i462.SimilarDataSource>(
        () => _i700.SimilarDataSourceImp(gh<_i489.SimilarApi>()));
    gh.factory<_i687.WatchlistRepo>(
        () => _i8.WatchlistRepoImpl(gh<_i81.WatchlistDataSource>()));
    gh.factory<_i662.DetailsRepo>(
        () => _i698.DetaisRepoImp(gh<_i267.DetailsDataSource>()));
    gh.factory<_i50.TopRatedRepo>(
        () => _i939.TopRatedRepoImp(gh<_i713.TopRatedDataSource>()));
    gh.factory<_i19.GetPopularUseCase>(
        () => _i19.GetPopularUseCase(gh<_i944.PopularRepo>()));
    gh.factory<_i13.GetReleasesUseCase>(
        () => _i13.GetReleasesUseCase(gh<_i526.ReleasesRepo>()));
    gh.factory<_i274.GetTopRatedUseCase>(
        () => _i274.GetTopRatedUseCase(gh<_i50.TopRatedRepo>()));
    gh.factory<_i451.GetSearchMoviesUseCase>(
        () => _i451.GetSearchMoviesUseCase(gh<_i598.SearchRepo>()));
    gh.factory<_i713.AddToWatchlistUseCase>(
        () => _i713.AddToWatchlistUseCase(gh<_i687.WatchlistRepo>()));
    gh.factory<_i253.GetWatchlistUseCase>(
        () => _i253.GetWatchlistUseCase(gh<_i687.WatchlistRepo>()));
    gh.factory<_i765.RemoveFromWatchlistUseCase>(
        () => _i765.RemoveFromWatchlistUseCase(gh<_i687.WatchlistRepo>()));
    gh.factory<_i436.SimilarRepo>(
        () => _i362.SimilarRepoImp(gh<_i462.SimilarDataSource>()));
    gh.factory<_i713.HomeProvider>(() => _i713.HomeProvider(
          gh<_i274.GetTopRatedUseCase>(),
          gh<_i19.GetPopularUseCase>(),
          gh<_i13.GetReleasesUseCase>(),
        ));
    gh.factory<_i398.GetDetailsUseCase>(
        () => _i398.GetDetailsUseCase(gh<_i662.DetailsRepo>()));
    gh.factory<_i794.SearchCubit>(
        () => _i794.SearchCubit(gh<_i451.GetSearchMoviesUseCase>()));
    gh.lazySingleton<_i449.WatchlistCubit>(() => _i449.WatchlistCubit(
          gh<_i253.GetWatchlistUseCase>(),
          gh<_i713.AddToWatchlistUseCase>(),
          gh<_i765.RemoveFromWatchlistUseCase>(),
        ));
    gh.factory<_i160.GetSimilarUseCase>(
        () => _i160.GetSimilarUseCase(gh<_i436.SimilarRepo>()));
    gh.factory<_i262.DetailsCubit>(() => _i262.DetailsCubit(
          gh<_i398.GetDetailsUseCase>(),
          gh<_i160.GetSimilarUseCase>(),
        ));
    return this;
  }
}

class _$HiveModule extends _i576.HiveModule {}
