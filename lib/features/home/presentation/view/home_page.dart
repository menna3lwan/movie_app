import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../view_model/home_provider.dart';
import '../view_model/home_states.dart';
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
      ..intent(GetTopRatedIntent())
      ..intent(GetPopularIntent())
      ..intent(GetReleasesIntent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeProvider,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SafeArea(
          child: BlocBuilder<HomeProvider, HomeStates>(
            builder: (context, state) {
              final combinedState = state as CombinedHomeState;

              final topRatedState = combinedState.topRatedState;
              final popularState = combinedState.popularState;
              final releasesState = combinedState.releasesState;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    TopRatedWidget(
                      movies: topRatedState is TopRatedSuccessState
                          ? topRatedState.movies
                          : null,
                      error: topRatedState is TopRatedErrorState
                          ? topRatedState.message
                          : null,
                    ),
                    const SizedBox(height: 16),
                    PopularWidget(
                      movies: popularState is PopularSuccessState
                          ? popularState.movies
                          : null,
                      error: popularState is PopularErrorState
                          ? popularState.message
                          : null,
                    ),
                    const SizedBox(height: 8),
                    ReleasesWidget(
                      movies: releasesState is ReleasesSuccessState
                          ? releasesState.movies
                          : null,
                      error: releasesState is ReleasesErrorState
                          ? releasesState.message
                          : null,
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
