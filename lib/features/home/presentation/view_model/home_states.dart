import '../../domain/entity/movie_entity.dart';

sealed class HomeState {}

class HomeInitial extends HomeState {}

sealed class TopRatedState extends HomeState {}

class TopRatedLoading extends TopRatedState {}

class TopRatedError extends TopRatedState {
  final String message;
  TopRatedError(this.message);
}

class TopRatedSuccess extends TopRatedState {
  final List<MovieEntity> movies;
  TopRatedSuccess(this.movies);
}

sealed class PopularState extends HomeState {}

class PopularLoading extends PopularState {}

class PopularError extends PopularState {
  final String message;
  PopularError(this.message);
}

class PopularSuccess extends PopularState {
  final List<MovieEntity> movies;
  PopularSuccess(this.movies);
}

sealed class ReleasesState extends HomeState {}

class ReleasesLoading extends ReleasesState {}

class ReleasesError extends ReleasesState {
  final String message;
  ReleasesError(this.message);
}

class ReleasesSuccess extends ReleasesState {
  final List<MovieEntity> movies;
  ReleasesSuccess(this.movies);
}
