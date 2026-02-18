import 'package:movie_app/feature/watch_list/domain/entity/watch_list_entity.dart';

sealed class WatchlistState {}

class WatchlistInitial extends WatchlistState {}

class WatchlistLoading extends WatchlistState {}

class WatchlistSuccess extends WatchlistState {
  final List<WatchlistMovieEntity> movies;

  WatchlistSuccess(this.movies);
}

class WatchlistEmpty extends WatchlistState {}

class WatchlistError extends WatchlistState {
  final String messageError;

  WatchlistError(this.messageError);
}
