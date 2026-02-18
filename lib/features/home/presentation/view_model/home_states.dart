import 'package:movie_app/features/home/data/models/movies_response_dto.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class NowPlayingLoadingState extends HomeStates {}

class NowPlayingErrorState extends HomeStates {
  String message;
  NowPlayingErrorState(this.message);
}

class NowPlayingSuccessState extends HomeStates {
  final MoviesResponseDto moviesResponseDto;
  NowPlayingSuccessState(this.moviesResponseDto);
}

class PopularLoadingState extends HomeStates {}

class PopularErrorState extends HomeStates {
  String message;
  PopularErrorState(this.message);
}

class PopularSuccessState extends HomeStates {
  final MoviesResponseDto moviesResponseDto;
  PopularSuccessState(this.moviesResponseDto);
}

class TopRatedLoadingState extends HomeStates {}

class TopRatedErrorState extends HomeStates {
  String message;
  TopRatedErrorState(this.message);
}

class TopRatedSuccessState extends HomeStates {
  final MoviesResponseDto moviesResponseDto;
  TopRatedSuccessState(this.moviesResponseDto);
}
