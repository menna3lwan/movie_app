import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/di/service_locator.config.dart';
<<<<<<< HEAD

=======
  
>>>>>>> df95b67d114e919723fb677e6bafe9b35ef78d93

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => await getIt.init();
