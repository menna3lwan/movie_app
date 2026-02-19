import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/details/presentation/view/details_screen.dart';
import '../../features/home/presentation/view/home_page.dart';
import '../../features/search/presentation/views/search_page.dart';
import '../../features/watch_list/presentation/views/watch_list_view.dart';
import '../common/widgets/main_scaffold.dart';
import 'routes.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.home.path,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => MainScaffold(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.home.path,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomePage()),
          ),
          GoRoute(
            path: AppRoutes.search.path,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SearchPage()),
          ),
          GoRoute(
            path: AppRoutes.watchList.path,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: WatchListView(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.movieDetail.path,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final movieId = int.parse(state.pathParameters['id'] ?? '0');
          return DetailsScreen(
            movieDetailsId: movieId,
            movieSimilarsId: movieId,
          );
        },
      ),
    ],
  );
}

