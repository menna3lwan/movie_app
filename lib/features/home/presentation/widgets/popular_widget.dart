import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/common_strings.dart';
import 'package:movie_app/features/home/presentation/view_model/home_cubit.dart';
import 'package:movie_app/features/home/presentation/view_model/home_states.dart';
import 'package:movie_app/features/home/presentation/widgets/base_movie_section_widget.dart';

class PopularWidget extends BaseMovieSectionWidget {
  const PopularWidget({super.key});

  @override
  String get sectionTitle => CommonStrings.popular;

  @override
  int get maxItems => 25;

  @override
  double get shimmerTitleWidth => 80.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen: (previous, current) =>
          current is PopularLoadingState ||
          current is PopularSuccessState ||
          current is PopularErrorState,
      builder: (context, state) {
        if (state is PopularErrorState) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else if (state is PopularSuccessState) {
          return buildSection(state.moviesResponseDto.results);
        } else {
          return buildShimmerLoading();
        }
      },
    );
  }
}
