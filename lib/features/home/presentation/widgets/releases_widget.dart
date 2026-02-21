import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/common_strings.dart';
import '../../domain/entity/movie_entity.dart';
import 'base_movie_section_widget.dart';

class ReleasesWidget extends BaseMovieSectionWidget {
  final List<MovieEntity>? movies;
  final String? error;

  const ReleasesWidget({super.key, required this.movies, required this.error});

  @override
  String get sectionTitle => CommonStrings.releasesMovies.tr();

  @override
  int get maxItems => 25;

  @override
  double get shimmerTitleWidth => 90.0;

  @override
  Widget build(BuildContext context) {
    if (error != null) {
      return Center(
        child: Text(error!, style: const TextStyle(color: Colors.red)),
      );
    }

    if (movies != null) {
      return buildSection(movies!);
    }

    return buildShimmerLoading();
  }
}
