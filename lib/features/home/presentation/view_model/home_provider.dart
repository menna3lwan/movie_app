import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/api_result.dart';
import '../../domain/entity/movie_entity.dart';
import '../../domain/use_case/get_popular_use_case.dart';
import '../../domain/use_case/get_releases_use_case.dart';
import '../../domain/use_case/get_top_rated_use_case.dart';
import 'home_states.dart';

@injectable
class HomeProvider extends Cubit<HomeState> {
  final GetTopRatedUseCase _getTopRatedUseCase;
  final GetPopularUseCase _getPopularUseCase;
  final GetReleasesUseCase _getReleasesUseCase;

  HomeProvider(
    this._getTopRatedUseCase,
    this._getPopularUseCase,
    this._getReleasesUseCase,
  ) : super(HomeInitial());

  Future<void> intent(HomeIntent event) async {
    switch (event) {
      case GetTopRatedIntent():
        await _getTopRated();
      case GetPopularIntent():
        await _getPopular();
      case GetReleasesIntent():
        await _getReleases();
    }
  }

  Future<void> _getTopRated() async {
    emit(TopRatedLoading());
    final result = await _getTopRatedUseCase.call();

    switch (result) {
      case ApiSuccess<List<MovieEntity>>():
        emit(TopRatedSuccess(result.data));
      case ApiFailure<List<MovieEntity>>():
        emit(TopRatedError(result.message));
    }
  }

  Future<void> _getPopular() async {
    emit(PopularLoading());
    final result = await _getPopularUseCase.call();

    switch (result) {
      case ApiSuccess<List<MovieEntity>>():
        emit(PopularSuccess(result.data));
      case ApiFailure<List<MovieEntity>>():
        emit(PopularError(result.message));
    }
  }

  Future<void> _getReleases() async {
    emit(ReleasesLoading());
    final result = await _getReleasesUseCase.call();

    switch (result) {
      case ApiSuccess<List<MovieEntity>>():
        emit(ReleasesSuccess(result.data));
      case ApiFailure<List<MovieEntity>>():
        emit(ReleasesError(result.message));
    }
  }
}

sealed class HomeIntent {}

class GetTopRatedIntent extends HomeIntent {}

class GetPopularIntent extends HomeIntent {}

class GetReleasesIntent extends HomeIntent {}
