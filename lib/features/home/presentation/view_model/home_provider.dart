import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/api_result.dart';
import '../../domain/entity/movie_entity.dart';
import '../../domain/use_case/get_popular_use_case.dart';
import '../../domain/use_case/get_releases_use_case.dart';
import '../../domain/use_case/get_top_rated_use_case.dart';
import 'home_states.dart';

@injectable
class HomeProvider extends Cubit<HomeStates> {
  final GetTopRatedUseCase _getTopRatedUseCase;
  final GetPopularUseCase _getPopularUseCase;
  final GetReleasesUseCase _getReleasesUseCase;

  HomeProvider(
    this._getTopRatedUseCase,
    this._getPopularUseCase,
    this._getReleasesUseCase,
  ) : super(CombinedHomeState(
          topRatedState: TopRatedLoadingState(),
          popularState: PopularLoadingState(),
          releasesState: ReleasesLoadingState(),
        ));

  CombinedHomeState get _current => state as CombinedHomeState;

  Future<void> intent(HomeIntent event) async {
    switch (event) {
      case GetTopRatedIntent():
        await getTopRatedMovies();
      case GetPopularIntent():
        await getPopularMovies();
      case GetReleasesIntent():
        await getReleasesMovies();
    }
  }

  Future<void> getTopRatedMovies() async {
    emit(_current.copyWith(topRatedState: TopRatedLoadingState()));
    final result = await _getTopRatedUseCase.call();
    switch (result) {
      case ApiSuccess<List<MovieEntity>>():
        emit(_current.copyWith(topRatedState: TopRatedSuccessState(result.data)));
      case ApiFailure<List<MovieEntity>>():
        emit(_current.copyWith(topRatedState: TopRatedErrorState(result.message)));
    }
  }

  Future<void> getPopularMovies() async {
    emit(_current.copyWith(popularState: PopularLoadingState()));
    final result = await _getPopularUseCase.call();
    switch (result) {
      case ApiSuccess<List<MovieEntity>>():
        emit(_current.copyWith(popularState: PopularSuccessState(result.data)));
      case ApiFailure<List<MovieEntity>>():
        emit(_current.copyWith(popularState: PopularErrorState(result.message)));
    }
  }

  Future<void> getReleasesMovies() async {
    emit(_current.copyWith(releasesState: ReleasesLoadingState()));
    final result = await _getReleasesUseCase.call();
    switch (result) {
      case ApiSuccess<List<MovieEntity>>():
        emit(_current.copyWith(releasesState: ReleasesSuccessState(result.data)));
      case ApiFailure<List<MovieEntity>>():
        emit(_current.copyWith(releasesState: ReleasesErrorState(result.message)));
    }
  }
}

sealed class HomeIntent {}

class GetTopRatedIntent extends HomeIntent {}

class GetPopularIntent extends HomeIntent {}

class GetReleasesIntent extends HomeIntent {}
