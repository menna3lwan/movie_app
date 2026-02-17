import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/feature/watch_list/data/models/watch_list_model.dart';

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
      title: 'Movie App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Movie App')),
        body: const Center(child: Text('Welcome to the Movie App!')),
      ),
    );
  }
}
