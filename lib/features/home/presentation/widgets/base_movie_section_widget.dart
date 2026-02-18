import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/common/widgets/shimmer_loading_widget.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/network/api_urls.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/theming/app_fonts.dart';
import 'package:movie_app/features/home/data/models/movie_dto.dart';

abstract class BaseMovieSectionWidget extends StatelessWidget {
  const BaseMovieSectionWidget({super.key});

  String get sectionTitle;
  int get maxItems => 20;
  double get cardWidth => 120.0;
  double get cardHeight => 190.0;
  double get shimmerTitleWidth => 80.0;

  Widget buildSection(List<MovieDto> movies) {
    if (movies.isEmpty) return const SizedBox.shrink();
    final displayMovies = movies.length > maxItems
        ? movies.sublist(0, maxItems)
        : movies;

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
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => context.push(
                  AppRoutes.movieDetail.withId(displayMovies[index].id),
                ),
                child: buildMovieCard(displayMovies[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildMovieCard(MovieDto movie) {
    return SizedBox(
      width: cardWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: buildPosterImage(
          posterPath: movie.posterPath,
          width: cardWidth,
          height: cardHeight,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildShimmerLoading() {
    return ShimmerLoadingWidget(
      cardWidth: cardWidth,
      cardHeight: cardHeight,
      titleWidth: shimmerTitleWidth,
    );
  }

  static Widget buildPosterImage({
    required String? posterPath,
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) {
    if (posterPath == null) return placeholder();
    return Image.network(
      '${ApiUrls.prefixImageUrl}$posterPath',
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, _, _) => placeholder(),
    );
  }

  static Widget placeholder() {
    return Container(
      color: AppColors.surface,
      child: const Icon(Icons.movie, color: Colors.grey),
    );
  }
}
