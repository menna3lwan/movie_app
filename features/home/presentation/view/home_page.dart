import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/service_locator.dart';
import '../view_model/home_provider.dart';
import '../widgets/popular_widget.dart' show PopularWidget;
import '../widgets/releases_widget.dart' show ReleasesWidget;
import '../widgets/top_rated_widget.dart' show TopRatedWidget;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeProvider homeProvider;

  @override
  void initState() {
    super.initState();
    homeProvider = getIt<HomeProvider>()
      ..getTopRatedMovies()
      ..getPopularMovies()
      ..getReleasesMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeProvider,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<HomeProvider, HomeState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    TopRatedWidget(
                      movies: state.topRatedMovies,
                      error: state.topRatedError,
                    ),
                    const SizedBox(height: 16),
                    PopularWidget(
                      movies: state.popularMovies,
                      error: state.popularError,
                    ),
                    const SizedBox(height: 8),
                    ReleasesWidget(
                      movies: state.releasesMovies,
                      error: state.releasesError,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
