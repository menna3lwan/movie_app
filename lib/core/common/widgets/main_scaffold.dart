import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_assets.dart';
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
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                color: Theme.of(context).colorScheme.outline, width: 0.5),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) => _onTap(context, index),
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
          backgroundColor: Theme.of(context).colorScheme.primary,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.iconHome,
                colorFilter: const ColorFilter.mode(
                  AppColorsDark.textSecondary,
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                AppAssets.iconHome,
                colorFilter: const ColorFilter.mode(
                  AppColorsDark.secondary,
                  BlendMode.srcIn,
                ),
              ),
              label: CommonStrings.home,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.iconSearch,
                colorFilter: const ColorFilter.mode(
                  AppColorsDark.textSecondary,
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                AppAssets.iconSearch,
                colorFilter: const ColorFilter.mode(
                  AppColorsDark.secondary,
                  BlendMode.srcIn,
                ),
              ),
              label: CommonStrings.search,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.iconBookmark,
                colorFilter: const ColorFilter.mode(
                  AppColorsDark.textSecondary,
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                AppAssets.iconBookmark,
                colorFilter: const ColorFilter.mode(
                  AppColorsDark.secondary,
                  BlendMode.srcIn,
                ),
              ),
              label: CommonStrings.watchList,
            ),
          ],
        ),
      ),
    );
  }
}
