import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/features/search/domain/entity/movie_entity.dart';

import 'package:movie_app/features/search/domain/usecases/search_movies_usecase.dart';
import 'search_states.dart';

@injectable
class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this._searchMoviesUseCase) : super(SearchInitialState());

  final GetSearchMoviesUseCase _searchMoviesUseCase;
  Timer? _debounce;

  Future<void> searchMovies(String query) async {
    if (query.trim().isEmpty) {
      emit(SearchSuccessState([]));
      return;
    }

    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      emit(SearchLoadingState());

      final result = await _searchMoviesUseCase.call(query);

      switch (result) {
        case ApiSuccess<List<SearchEntity>>():
          emit(SearchSuccessState(result.data));

        case ApiFailure<List<SearchEntity>>():
          emit(SearchErrorState(result.message));
      }
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
