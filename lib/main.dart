import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/feature/details/presentation/view/details_screen.dart';
import 'package:movie_app/feature/watch_list/data/models/watch_list_model.dart';
<<<<<<< HEAD
import 'package:movie_app/feature/watch_list/presentation/views/watch_list_view.dart';
import 'package:movie_app/features/details/presentation/view/details_screen.dart';
import 'package:movie_app/search_feature/search/presentation/views/search_page.dart';
=======
>>>>>>> df95b67d114e919723fb677e6bafe9b35ef78d93

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
<<<<<<< HEAD
      home: Scaffold(
          backgroundColor: AppColors.primary,
          // appBar: CustomAppBar(
          //     isTrue: true,
          //     leading: Icon(Icons.menu),
          //     title: CommonStrings.watchList),
          body: SearchPage()),
=======
      home: Scaffold(backgroundColor: AppColors.primary, body: DetailsScreen()),
>>>>>>> df95b67d114e919723fb677e6bafe9b35ef78d93
    );
  }
}
