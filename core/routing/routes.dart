
sealed class Routes {
  final String path;

  const Routes(this.path);

  @override
  String toString() => path;
}

class HomeRoute extends Routes {
  const HomeRoute() : super('/home');
}

class SearchRoute extends Routes {
  const SearchRoute() : super('/search');
}

class WatchListRoute extends Routes {
  const WatchListRoute() : super('/watchlist');
}

class MovieDetailRoute extends Routes {
  const MovieDetailRoute() : super('/movie/:id');

  String withId(int movieId) => '/movie/$movieId';
}
abstract class AppRoutes {
  static const home = HomeRoute();
  static const search = SearchRoute();
  static const watchList = WatchListRoute();
  static const movieDetail = MovieDetailRoute();
}
