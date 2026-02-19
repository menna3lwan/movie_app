import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
<<<<<<< HEAD:core/di/service_locator.dart

import 'service_locator.config.dart';

final getIt = GetIt.instance;
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async => getIt.init();
=======
import 'package:movie_app/core/di/service_locator.config.dart';


  

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => await getIt.init();
>>>>>>> 4dd6fad309e4a25c2468dcd43fbf5c1b7ca9a495:lib/core/di/service_locator.dart
