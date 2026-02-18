import 'package:get_it/get_it.dart';
import 'package:movie_app/core/di/service_locator.config.dart';

final getIt = GetIt.instance;

void configureDependencies() => getIt.init();
