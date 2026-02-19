import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/features/details/domain/entity/details_entity.dart';
import 'package:movie_app/features/details/domain/entity/similar_entity.dart';
import 'package:movie_app/features/details/domain/use_case/get_details_use_case.dart';
import 'package:movie_app/features/details/domain/use_case/get_similar_use_case.dart';
import 'package:movie_app/features/details/presentation/view_model/details_states.dart';

@injectable
class DetailsCubit extends Cubit<DetailsStates> {
  DetailsCubit(this._getDetailsUseCase, this._getSimilarUseCase)
      : super(CombinedDetailsState(
          detailsState: DetailsLoadingState(),
          similarState: SimilarLoadingState(),
        ));

  final GetDetailsUseCase _getDetailsUseCase;
  final GetSimilarUseCase _getSimilarUseCase;

  CombinedDetailsState get _current => state as CombinedDetailsState;

  Future<void> intent(DetailsIntent event) async {
    switch (event) {
      case GetDetailsIntent():
        await getMovieDetails(event.movieId);
      case GetSimilarIntent():
        await getMovieSimilars(event.movieId);
    }
  }

  Future<void> getMovieDetails(int movieId) async {
    emit(_current.copyWith(detailsState: DetailsLoadingState()));
    final result = await _getDetailsUseCase.call(movieId);
    switch (result) {
      case ApiSuccess<DetailsEntity>():
        emit(_current.copyWith(detailsState: DetailsSuccessState(result.data)));
      case ApiFailure<DetailsEntity>():
        emit(_current.copyWith(detailsState: DetailsErrorState(result.message)));
    }
  }

  Future<void> getMovieSimilars(int movieId) async {
    emit(_current.copyWith(similarState: SimilarLoadingState()));
    final result = await _getSimilarUseCase.call(movieId);
    switch (result) {
      case ApiSuccess<SimilarEntity>():
        emit(_current.copyWith(similarState: SimilarSuccessState(result.data)));
      case ApiFailure<SimilarEntity>():
        emit(_current.copyWith(similarState: SimilarErrorState(result.message)));
    }
  }
}

sealed class DetailsIntent {}

class GetDetailsIntent extends DetailsIntent {
  final int movieId;
  GetDetailsIntent(this.movieId);
}

class GetSimilarIntent extends DetailsIntent {
  final int movieId;
  GetSimilarIntent(this.movieId);
}