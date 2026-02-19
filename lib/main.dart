import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/di/service_locator.dart';

import 'package:movie_app/features/search/presentation/views/search_page.dart';
import 'package:movie_app/features/watch_list/data/models/watch_list_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WatchlistMovieModelAdapter());
  await configureDependencies();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      home: Scaffold(backgroundColor: AppColors.primary, body: SearchPage()),
    );
  }
}
