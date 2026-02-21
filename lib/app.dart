import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/theme_cubit.dart';

import 'core/constants/common_strings.dart';
import 'core/routing/app_router.dart';
import 'core/theming/app_theme.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, currentThemeMode) {
              return MaterialApp.router(
                title: CommonStrings.appName,
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: currentThemeMode,
                routerConfig: AppRouter.router,
              );
            },
          );
        },
      ),
    );
  }
}
