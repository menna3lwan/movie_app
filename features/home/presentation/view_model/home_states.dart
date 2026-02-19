import 'package:flutter/foundation.dart';
import '../../domain/entity/movie_entity.dart';

@immutable
class HomeState {
  final List<MovieEntity>? topRatedMovies;
  final String? topRatedError;
  final List<MovieEntity>? popularMovies;
  final String? popularError;
  final List<MovieEntity>? releasesMovies;
  final String? releasesError;

  const HomeState({
    this.topRatedMovies,
    this.topRatedError,
    this.popularMovies,
    this.popularError,
    this.releasesMovies,
    this.releasesError,
  });
}
