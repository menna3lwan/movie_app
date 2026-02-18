// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movie_app/core/di/hive_module.dart' as _i359;
import 'package:movie_app/feature/watch_list/data/models/watch_list_model.dart'
    as _i81;
import 'package:movie_app/feature/watch_list/data/repo/data_source_impl/watch_list_data_source_impl.dart'
    as _i314;
import 'package:movie_app/feature/watch_list/data/repo/repositories_impl/watch_list_repo_impl.dart'
    as _i488;
import 'package:movie_app/feature/watch_list/domain/repositories/data_source/watch_list_data_source.dart'
    as _i1000;
import 'package:movie_app/feature/watch_list/domain/repositories/repo/watch_list_repo.dart'
    as _i696;
import 'package:movie_app/feature/watch_list/domain/usecases/add_to_watch_list_usecase.dart'
    as _i420;
import 'package:movie_app/feature/watch_list/domain/usecases/get_watch_list_usecase.dart'
    as _i876;
import 'package:movie_app/feature/watch_list/domain/usecases/remove_from_watch_list_usecase.dart'
    as _i967;
import 'package:movie_app/feature/watch_list/presentation/view_model/cubit/watch_list_cubit.dart'
    as _i145;

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
    await gh.factoryAsync<_i979.Box<_i81.WatchlistMovieModel>>(
      () => hiveModule.getWatchlistBox(),
      preResolve: true,
    );
    gh.factory<_i1000.WatchlistDataSource>(() => _i314.WatchlistDataSourceImpl(
        gh<_i979.Box<_i81.WatchlistMovieModel>>()));
    gh.factory<_i696.WatchlistRepo>(
        () => _i488.WatchlistRepoImpl(gh<_i1000.WatchlistDataSource>()));
    gh.factory<_i420.AddToWatchlistUseCase>(
        () => _i420.AddToWatchlistUseCase(gh<_i696.WatchlistRepo>()));
    gh.factory<_i876.GetWatchlistUseCase>(
        () => _i876.GetWatchlistUseCase(gh<_i696.WatchlistRepo>()));
    gh.factory<_i967.RemoveFromWatchlistUseCase>(
        () => _i967.RemoveFromWatchlistUseCase(gh<_i696.WatchlistRepo>()));
    gh.factory<_i145.WatchlistCubit>(() => _i145.WatchlistCubit(
          gh<_i876.GetWatchlistUseCase>(),
          gh<_i420.AddToWatchlistUseCase>(),
          gh<_i967.RemoveFromWatchlistUseCase>(),
        ));
    return this;
  }
}

class _$HiveModule extends _i359.HiveModule {}
import 'package:injectable/injectable.dart' as _i526;
import 'package:movie_app/features/details/data/details_api.dart' as _i443;
import 'package:movie_app/features/details/data/repo/data_source/details_data_source_imp.dart'
    as _i976;
import 'package:movie_app/features/details/data/repo/data_source/similar_data_source_imp.dart'
    as _i882;
import 'package:movie_app/features/details/data/repo/repository/detais_repo_imp.dart'
    as _i794;
import 'package:movie_app/features/details/data/repo/repository/similar_repo_imp.dart'
    as _i701;
import 'package:movie_app/features/details/data/similar_api.dart' as _i290;
import 'package:movie_app/features/details/domain/repo/data_source/details_data_source.dart'
    as _i309;
import 'package:movie_app/features/details/domain/repo/data_source/similar_data_source.dart'
    as _i531;
import 'package:movie_app/features/details/domain/repo/repository/details_repo.dart'
    as _i554;
import 'package:movie_app/features/details/domain/repo/repository/similar_repo.dart'
    as _i230;
import 'package:movie_app/features/details/domain/use_case/get_details_use_case.dart'
    as _i314;
import 'package:movie_app/features/details/domain/use_case/get_similar_use_case.dart'
    as _i297;
import 'package:movie_app/features/details/presentation/view_model/details_cubit.dart'
    as _i171;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i443.DetailsApi>(() => _i443.DetailsApi());
    gh.factory<_i290.SimilarApi>(() => _i290.SimilarApi());
    gh.factory<_i531.SimilarDataSource>(
      () => _i882.SimilarDataSourceImp(gh<_i290.SimilarApi>()),
    );
    gh.factory<_i309.DetailsDataSource>(
      () => _i976.DetailsDataSourceImp(gh<_i443.DetailsApi>()),
    );
    gh.factory<_i554.DetailsRepo>(
      () => _i794.DetaisRepoImp(gh<_i309.DetailsDataSource>()),
    );
    gh.factory<_i314.GetDetailsUseCase>(
      () => _i314.GetDetailsUseCase(gh<_i554.DetailsRepo>()),
    );
    gh.factory<_i230.SimilarRepo>(
      () => _i701.SimilarRepoImp(gh<_i531.SimilarDataSource>()),
    );
    gh.factory<_i297.GetSimilarUseCase>(
      () => _i297.GetSimilarUseCase(gh<_i230.SimilarRepo>()),
    );
    gh.factory<_i171.DetailsCubit>(
      () => _i171.DetailsCubit(
        gh<_i314.GetDetailsUseCase>(),
        gh<_i297.GetSimilarUseCase>(),
      ),
    );
    return this;
  }
}
