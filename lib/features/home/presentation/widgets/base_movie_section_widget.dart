import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/common/widgets/app_cached_image.dart';

import '../../../../core/common/widgets/shimmer_loading_widget.dart';
import '../../../../core/network/api_urls.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../domain/entity/movie_entity.dart';

abstract class BaseMovieSectionWidget extends StatelessWidget {
  const BaseMovieSectionWidget({super.key});

  String get sectionTitle;
  int get maxItems => 20;
  double get cardWidth => 120.0;
  double get cardHeight => 190.0;
  double get shimmerTitleWidth => 80.0;

  Widget buildSection(List<MovieEntity> movies) {
    if (movies.isEmpty) return const SizedBox.shrink();

    final displayMovies =
        movies.length > maxItems ? movies.sublist(0, maxItems) : movies;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Text(sectionTitle, style: AppFonts.sectionTitle),
        ),
        SizedBox(
          height: cardHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: displayMovies.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final movie = displayMovies[index];
              return GestureDetector(
                onTap: () {
                  context.push(AppRoutes.movieDetail.withId(movie.id));
                },
                child: SizedBox(
                  width: cardWidth,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AppCachedImage(
                      imageUrl: '${ApiUrls.prefixImageUrl}${movie.posterPath}',
                      width: cardWidth,
                      height: cardHeight,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildShimmerLoading() {
    return ShimmerLoadingWidget(
      cardWidth: cardWidth,
      cardHeight: cardHeight,
      titleWidth: shimmerTitleWidth,
    );
  }
}
