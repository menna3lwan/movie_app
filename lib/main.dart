import 'package:flutter/material.dart';

import 'package:movie_app/core/di/service_locator.config.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/theming/app_theme.dart';
import 'features/details/presentation/view/details_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.init();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      home: DetailsScreen(),
      theme: AppTheme.darkTheme,
    );
  }
}
