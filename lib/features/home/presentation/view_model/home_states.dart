import '../../domain/entity/movie_entity.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class TopRatedLoadingState extends HomeStates {}

class TopRatedErrorState extends HomeStates {
  String message;
  TopRatedErrorState(this.message);
}

class TopRatedSuccessState extends HomeStates {
  final List<MovieEntity> movies;
  TopRatedSuccessState(this.movies);
}

class PopularLoadingState extends HomeStates {}

class PopularErrorState extends HomeStates {
  String message;
  PopularErrorState(this.message);
}

class PopularSuccessState extends HomeStates {
  final List<MovieEntity> movies;
  PopularSuccessState(this.movies);
}

class ReleasesLoadingState extends HomeStates {}

class ReleasesErrorState extends HomeStates {
  String message;
  ReleasesErrorState(this.message);
}

class ReleasesSuccessState extends HomeStates {
  final List<MovieEntity> movies;
  ReleasesSuccessState(this.movies);
}

class CombinedHomeState extends HomeStates {
  final HomeStates topRatedState;
  final HomeStates popularState;
  final HomeStates releasesState;

  CombinedHomeState({
    required this.topRatedState,
    required this.popularState,
    required this.releasesState,
  });

  CombinedHomeState copyWith({
    HomeStates? topRatedState,
    HomeStates? popularState,
    HomeStates? releasesState,
  }) {
    return CombinedHomeState(
      topRatedState: topRatedState ?? this.topRatedState,
      popularState: popularState ?? this.popularState,
      releasesState: releasesState ?? this.releasesState,
    );
  }
}
