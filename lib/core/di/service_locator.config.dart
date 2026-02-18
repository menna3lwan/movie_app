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
import 'package:movie_app/core/di/hive_module.dart' as _i359;
import 'package:movie_app/feature/details/data/details_api.dart' as _i588;
import 'package:movie_app/feature/details/data/repo/data_source/details_data_source_imp.dart'
    as _i647;
import 'package:movie_app/feature/details/data/repo/data_source/similar_data_source_imp.dart'
    as _i189;
import 'package:movie_app/feature/details/data/repo/repository/detais_repo_imp.dart'
    as _i829;
import 'package:movie_app/feature/details/data/repo/repository/similar_repo_imp.dart'
    as _i78;
import 'package:movie_app/feature/details/data/similar_api.dart' as _i728;
import 'package:movie_app/feature/details/domain/repo/data_source/details_data_source.dart'
    as _i901;
import 'package:movie_app/feature/details/domain/repo/data_source/similar_data_source.dart'
    as _i113;
import 'package:movie_app/feature/details/domain/repo/repository/details_repo.dart'
    as _i979;
import 'package:movie_app/feature/details/domain/repo/repository/similar_repo.dart'
    as _i368;
import 'package:movie_app/feature/details/domain/use_case/get_details_use_case.dart'
    as _i567;
import 'package:movie_app/feature/details/domain/use_case/get_similar_use_case.dart'
    as _i265;
import 'package:movie_app/feature/details/presentation/view_model/details_cubit.dart'
    as _i96;
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
    gh.factory<_i588.DetailsApi>(() => _i588.DetailsApi());
    gh.factory<_i728.SimilarApi>(() => _i728.SimilarApi());
    gh.factory<_i901.DetailsDataSource>(
        () => _i647.DetailsDataSourceImp(gh<_i588.DetailsApi>()));
    gh.factory<_i113.SimilarDataSource>(
        () => _i189.SimilarDataSourceImp(gh<_i728.SimilarApi>()));
    gh.factory<_i1000.WatchlistDataSource>(() => _i314.WatchlistDataSourceImpl(
        gh<_i979.Box<_i81.WatchlistMovieModel>>()));
    gh.factory<_i368.SimilarRepo>(
        () => _i78.SimilarRepoImp(gh<_i113.SimilarDataSource>()));
    gh.factory<_i979.DetailsRepo>(
        () => _i829.DetaisRepoImp(gh<_i901.DetailsDataSource>()));
    gh.factory<_i567.GetDetailsUseCase>(
        () => _i567.GetDetailsUseCase(gh<_i979.DetailsRepo>()));
    gh.factory<_i696.WatchlistRepo>(
        () => _i488.WatchlistRepoImpl(gh<_i1000.WatchlistDataSource>()));
    gh.factory<_i265.GetSimilarUseCase>(
        () => _i265.GetSimilarUseCase(gh<_i368.SimilarRepo>()));
    gh.factory<_i96.DetailsCubit>(() => _i96.DetailsCubit(
          gh<_i567.GetDetailsUseCase>(),
          gh<_i265.GetSimilarUseCase>(),
        ));
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
