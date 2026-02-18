import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/common_strings.dart';
import 'package:movie_app/features/home/presentation/view_model/home_cubit.dart';
import 'package:movie_app/features/home/presentation/view_model/home_states.dart';
import 'package:movie_app/features/home/presentation/widgets/base_movie_section_widget.dart';

class TopRatedWidget extends BaseMovieSectionWidget {
  const TopRatedWidget({super.key});

  @override
  String get sectionTitle => CommonStrings.topRated;

  @override
  int get maxItems => 25;

  @override
  double get shimmerTitleWidth => 90.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen: (previous, current) =>
          current is TopRatedLoadingState ||
          current is TopRatedSuccessState ||
          current is TopRatedErrorState,
      builder: (context, state) {
        if (state is TopRatedErrorState) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else if (state is TopRatedSuccessState) {
          return buildSection(state.moviesResponseDto.results);
        } else {
          return buildShimmerLoading();
        }
      },
    );
  }
}
