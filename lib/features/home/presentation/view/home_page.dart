import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
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
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),

                BlocBuilder<HomeProvider, HomeState>(
                  buildWhen: (previous, current) => current is TopRatedState,
                  builder: (context, state) {
                    return TopRatedWidget(
                      movies: state is TopRatedSuccess ? state.movies
                          : null,
                      error: state is TopRatedError ? state.message
                          : null,
                    );
                  },
                ),

                const SizedBox(height: 16),

                BlocBuilder<HomeProvider, HomeState>(
                  buildWhen: (previous, current) => current is PopularState,
                  builder: (context, state) {
                    return PopularWidget(
                      movies: state is PopularSuccess ? state.movies
                          : null,
                      error: state is PopularError ? state.message
                          : null,
                    );
                  },
                ),

                const SizedBox(height: 8),

                BlocBuilder<HomeProvider, HomeState>(
                  buildWhen: (previous, current) => current is ReleasesState,
                  builder: (context, state) {
                    return ReleasesWidget(
                      movies: state is ReleasesSuccess ? state.movies
                          : null,
                      error: state is ReleasesError ? state.message
                          : null,
                    );
                  },
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
