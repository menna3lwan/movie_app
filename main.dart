import 'package:flutter/material.dart';
import 'package:movie_app/core/di/service_locator.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MovieApp());
}
