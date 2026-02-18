import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_assets.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/theming/app_fonts.dart';
import 'package:movie_app/feature/watch_list/domain/entity/watch_list_entity.dart';
import 'package:movie_app/feature/watch_list/presentation/widgets/info_row_widget.dart';

class WatchListItem extends StatelessWidget {
  const WatchListItem({super.key, required this.movie});
  final WatchlistMovieEntity movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
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
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 10,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: movie.posterPath,
                fit: BoxFit.cover,
                placeholder: (_, __) => Container(
                  color: AppColors.grey,
                  child: Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (_, __, ___) => Icon(Icons.error),
                fadeOutDuration: const Duration(milliseconds: 50),
              ),
            ),
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
                  text:
                      movie.genres.isNotEmpty ? movie.genres.first : "Unknown",
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
    );
  }
}
