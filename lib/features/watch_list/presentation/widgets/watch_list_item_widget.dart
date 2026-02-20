import 'package:flutter/material.dart';
import 'package:movie_app/core/common/widgets/app_cached_image.dart';
import 'package:movie_app/core/constants/app_assets.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/theming/app_fonts.dart';
import 'package:movie_app/features/details/presentation/view/details_screen.dart';
import 'package:movie_app/features/watch_list/domain/entity/watch_list_entity.dart';
import 'package:movie_app/features/watch_list/presentation/view_model/cubit/watch_list_cubit.dart';
import 'package:movie_app/features/watch_list/presentation/widgets/info_row_widget.dart';

class WatchListItem extends StatelessWidget {
  const WatchListItem({super.key, required this.movie});
  final WatchlistMovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailsScreen(
                movieDetailsId: movie.id,
                movieSimilarsId: movie.id,
              ),
            ),
          ).then((_) {
            getIt<WatchlistCubit>().intent(LoadWatchlistEvent());
          });
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 95,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AppCachedImage(imageUrl: movie.posterPath)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: AppFonts.bodyLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 14),
                  InfoRowWidget(
                    icon: AppAssets.star,
                    text: movie.voteAverage.toString(),
                    color: AppColors.star,
                  ),
                  const SizedBox(height: 5),
                  InfoRowWidget(
                    icon: AppAssets.ticket,
                    text: movie.genres.isNotEmpty
                        ? movie.genres.first
                        : "Unknown",
                  ),
                  const SizedBox(height: 5),
                  InfoRowWidget(
                    icon: AppAssets.calendarBlank,
                    text: movie.releaseDate.substring(0, 4),
                  ),
                  const SizedBox(height: 5),
                  InfoRowWidget(
                    icon: AppAssets.clock,
                    text: "${movie.runtime} minutes",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
