import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/features/watch_list/data/models/watch_list_model.dart';

import 'app.dart';
import 'core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized(); 

  await Hive.initFlutter();
  Hive.registerAdapter(WatchlistMovieModelAdapter());

  await configureDependencies();
  runApp(const MovieApp());

}
