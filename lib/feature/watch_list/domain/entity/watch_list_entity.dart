class WatchlistMovieEntity {
  final int id;
  final String title;
  final String posterPath;
  final double voteAverage;
  final String releaseDate;
  final List<String> genres;
  final int runtime;

  const WatchlistMovieEntity({
    this.id = 0,
    this.title = "",
    this.posterPath = "",
    this.voteAverage = 0.0,
    this.releaseDate = "",
    this.genres = const [],
    this.runtime = 0,
  });
}
