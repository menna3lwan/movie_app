import 'package:movie_app/search_feature/search/domain/entity/movie_entity.dart';

sealed class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {
  final List<SearchEntity> movies;

  SearchSuccessState(this.movies);
}



class SearchErrorState extends SearchStates {
  final String message;

  SearchErrorState(this.message);
}
