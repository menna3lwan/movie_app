import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/features/home/presentation/view_model/home_cubit.dart';
import 'package:movie_app/features/home/presentation/widgets/now_playing_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/popular_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/top_rated_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()
        ..getNowPlayingMovies()
        ..getPopularMovies()
        ..getTopRatedMovies(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              NowPlayingWidget(),
              SizedBox(height: 16),
              PopularWidget(),
              SizedBox(height: 8),
              TopRatedWidget(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
