import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/features/watch_list/domain/entity/watch_list_entity.dart';
import 'package:movie_app/features/watch_list/domain/usecases/add_to_watch_list_usecase.dart';
import 'package:movie_app/features/watch_list/domain/usecases/get_watch_list_usecase.dart';
import 'package:movie_app/features/watch_list/domain/usecases/remove_from_watch_list_usecase.dart';
import 'package:movie_app/features/watch_list/presentation/view_model/cubit/watch_list_state.dart';

@injectable
class WatchlistCubit extends Cubit<WatchlistState> {
  WatchlistCubit(
    this._getWatchlistUseCase,
    this._addToWatchlistUseCase,
    this._removeFromWatchlistUseCase,
  ) : super(WatchlistInitial());

  final GetWatchlistUseCase _getWatchlistUseCase;
  final AddToWatchlistUseCase _addToWatchlistUseCase;
  final RemoveFromWatchlistUseCase _removeFromWatchlistUseCase;

  Future<void> intent(WatchlistEvent event) async {
    switch (event) {
      case LoadWatchlistEvent():
        await _loadWatchlist();
        break;

      case ToggleWatchlistEvent():
        await _toggleWatchlist(event.movie);
        break;

      case RemoveWatchlistEvent():
        await _removeMovie(event.id);
        break;
    }
  }

  Future<void> _loadWatchlist() async {
    emit(WatchlistLoading());

    try {
      final movies = _getWatchlistUseCase();

      if (movies.isEmpty) {
        emit(WatchlistEmpty());
      } else {
        emit(WatchlistSuccess(movies));
      }
    } catch (e) {
      emit(WatchlistError(e.toString()));
    }
  }

  Future<void> _toggleWatchlist(WatchlistMovieEntity movie) async {
    final currentMovies = _getWatchlistUseCase();

    final isExist = currentMovies.any((e) => e.id == movie.id);

    if (isExist) {
      await _removeFromWatchlistUseCase(movie.id);
    } else {
      await _addToWatchlistUseCase(movie);
    }

    await _loadWatchlist();
  }

  Future<void> _removeMovie(int id) async {
    await _removeFromWatchlistUseCase(id);

    await _loadWatchlist();
  }

  bool isMovieInWatchlist(int id) {
    final movies = _getWatchlistUseCase();
    return movies.any((e) => e.id == id);
  }
}

sealed class WatchlistEvent {}

class LoadWatchlistEvent extends WatchlistEvent {}

class ToggleWatchlistEvent extends WatchlistEvent {
  final WatchlistMovieEntity movie;

  ToggleWatchlistEvent(this.movie);
}

class RemoveWatchlistEvent extends WatchlistEvent {
  final int id;

  RemoveWatchlistEvent(this.id);
}
