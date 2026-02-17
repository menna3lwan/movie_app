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
    return this;
  }
}

class _$HiveModule extends _i359.HiveModule {}
