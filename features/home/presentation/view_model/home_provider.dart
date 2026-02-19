// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/movie_entity.dart';
import '../../domain/use_case/get_popular_use_case.dart';
import '../../domain/use_case/get_releases_use_case.dart';
import '../../domain/use_case/get_top_rated_use_case.dart';

@injectable
class HomeProvider extends Cubit<HomeState> {
  final GetTopRatedUseCase _getTopRatedUseCase;
  final GetPopularUseCase _getPopularUseCase;
  final GetReleasesUseCase _getReleasesUseCase;

  HomeProvider(
    this._getTopRatedUseCase,
    this._getPopularUseCase,
    this._getReleasesUseCase,
  ) : super(HomeState());

  Future<void> getTopRatedMovies() async {
    try {
      final response = await _getTopRatedUseCase();
      emit(
        HomeState(
          topRatedMovies: response,
          topRatedError: null,
          popularMovies: state.popularMovies,
          popularError: state.popularError,
          releasesMovies: state.releasesMovies,
          releasesError: state.releasesError,
        ),
      );
    } catch (e) {
      emit(
        HomeState(
          topRatedMovies: state.topRatedMovies,
          topRatedError: e.toString(),
          popularMovies: state.popularMovies,
          popularError: state.popularError,
          releasesMovies: state.releasesMovies,
          releasesError: state.releasesError,
        ),
      );
    }
  }

  Future<void> getPopularMovies() async {
    try {
      final response = await _getPopularUseCase();
      emit(
        HomeState(
          topRatedMovies: state.topRatedMovies,
          topRatedError: state.topRatedError,
          popularMovies: response,
          popularError: null,
          releasesMovies: state.releasesMovies,
          releasesError: state.releasesError,
        ),
      );
    } catch (e) {
      emit(
        HomeState(
          topRatedMovies: state.topRatedMovies,
          topRatedError: state.topRatedError,
          popularMovies: state.popularMovies,
          popularError: e.toString(),
          releasesMovies: state.releasesMovies,
          releasesError: state.releasesError,
        ),
      );
    }
  }

  Future<void> getReleasesMovies() async {
    try {
      final response = await _getReleasesUseCase();
      emit(
        HomeState(
          topRatedMovies: state.topRatedMovies,
          topRatedError: state.topRatedError,
          popularMovies: state.popularMovies,
          popularError: state.popularError,
          releasesMovies: response,
          releasesError: null,
        ),
      );
    } catch (e) {
      emit(
        HomeState(
          topRatedMovies: state.topRatedMovies,
          topRatedError: state.topRatedError,
          popularMovies: state.popularMovies,
          popularError: state.popularError,
          releasesMovies: state.releasesMovies,
          releasesError: e.toString(),
        ),
      );
    }
  }
}

class HomeState {
  final List<MovieEntity>? topRatedMovies;
  final String? topRatedError;
  final List<MovieEntity>? popularMovies;
  final String? popularError;
  final List<MovieEntity>? releasesMovies;
  final String? releasesError;

  HomeState({
    this.topRatedMovies,
    this.topRatedError,
    this.popularMovies,
    this.popularError,
    this.releasesMovies,
    this.releasesError,
  });

  HomeState copyWith({
    List<MovieEntity>? topRatedMovies,
    String? topRatedError,
    List<MovieEntity>? popularMovies,
    String? popularError,
    List<MovieEntity>? releasesMovies,
    String? releasesError,
  }) {
    return HomeState(
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedError: topRatedError ?? this.topRatedError,
      popularMovies: popularMovies ?? this.popularMovies,
      popularError: popularError ?? this.popularError,
      releasesMovies: releasesMovies ?? this.releasesMovies,
      releasesError: releasesError ?? this.releasesError,
    );
  }
}
