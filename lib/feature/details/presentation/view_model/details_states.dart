import 'package:movie_app/feature/details/domain/entity/details_entity.dart';
import 'package:movie_app/feature/details/domain/entity/similar_entity.dart';

abstract class DetailsStates {}

class DetailsInitialState extends DetailsStates {}

class DetailsLoadingState extends DetailsStates {}

class DetailsErrorState extends DetailsStates {
  String message;
  DetailsErrorState(this.message);
}

class DetailsSuccessState extends DetailsStates {
  final DetailsEntity detailsEntity;
  DetailsSuccessState(this.detailsEntity);
}

class SimilarLoadingState extends DetailsStates {}

class SimilarErrorState extends DetailsStates {
  String message;
  SimilarErrorState(this.message);
}

class SimilarSuccessState extends DetailsStates {
  final SimilarEntity similarEntity;
  SimilarSuccessState(this.similarEntity);
}

class CombinedDetailsState extends DetailsStates {
  final DetailsStates detailsState;
  final DetailsStates similarState;

  CombinedDetailsState({
    required this.detailsState,
    required this.similarState,
  });

  CombinedDetailsState copyWith({
    DetailsStates? detailsState,
    DetailsStates? similarState,
  }) {
    return CombinedDetailsState(
      detailsState: detailsState ?? this.detailsState,
      similarState: similarState ?? this.similarState,
    );
  }
}