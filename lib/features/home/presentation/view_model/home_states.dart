import 'package:movie_app/features/home/domain/entities/movie_entity.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class NowPlayingLoadingState extends HomeStates {}

class NowPlayingErrorState extends HomeStates {
  String message;
  NowPlayingErrorState(this.message);
}

class NowPlayingSuccessState extends HomeStates {
  final List<MovieEntity> movies;
  NowPlayingSuccessState(this.movies);
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

class TopRatedLoadingState extends HomeStates {}

class TopRatedErrorState extends HomeStates {
  String message;
  TopRatedErrorState(this.message);
}

class TopRatedSuccessState extends HomeStates {
  final List<MovieEntity> movies;
  TopRatedSuccessState(this.movies);
}
