import 'package:get_it/get_it.dart';
import 'package:movie_app/features/home/presentation/view_model/home_cubit.dart';

extension GetItInjectableX on GetIt {
  void init() {
    registerFactory<HomeCubit>(() => HomeCubit());
  }
}
