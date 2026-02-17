
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_colors.dart';
import '../../constants/common_strings.dart';
import '../../routing/routes.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});
  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith(AppRoutes.home.path)) return 0;
    if (location.startsWith(AppRoutes.search.path)) return 1;
    if (location.startsWith(AppRoutes.watchList.path)) return 2;
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    final routes = [AppRoutes.home, AppRoutes.search, AppRoutes.watchList];
    context.go(routes[index].path);
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _currentIndex(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.divider, width: 0.5),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) => _onTap(context, index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: CommonStrings.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: CommonStrings.search,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outline),
              activeIcon: Icon(Icons.bookmark),
              label: CommonStrings.watchList,
            ),
          ],
        ),
      ),
    );
  }
}
