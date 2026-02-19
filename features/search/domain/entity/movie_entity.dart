class SearchEntity {
  int id ;
  String title ;
  String originalTitle;
  String overview ;
  String releaseDate ;
  String originalLanguage ;
  double popularity ;
  double voteAverage ;
  int voteCount ;
  String posterPath;
  String backdropPath;
  bool adult ;
  bool video ;
  List<int> genreIds;

  SearchEntity({
    this.id = 0,
    this.title = '',
    this.originalTitle = '',
    this.overview = '',
    this.releaseDate = '',
    this.originalLanguage = '',
    this.popularity = 0.0,
    this.voteAverage = 0.0,
    this.voteCount = 0,
    this.posterPath = '',
    this.backdropPath = '',
    this.adult = false,
    this.video = false,
    this.genreIds = const [],
  });
}