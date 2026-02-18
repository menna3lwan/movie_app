class ApiUrls {
  static const String baseUrl = "api.themoviedb.org";
  static const String apiKey = "9d7f94be913eddf2db40e317d2f12f36";
  static String getMovieDetails(int movieId) {
    return "/3/movie/$movieId";
  }
  static String getMovieSimilars(int movieId) {
    return "/3/movie/$movieId/similar";
  }

  static String prefixImageUrl = "https://image.tmdb.org/t/p/w500/";
}
