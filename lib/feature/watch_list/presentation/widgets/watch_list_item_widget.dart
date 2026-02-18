import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/constants/app_assets.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/theming/app_fonts.dart';
import 'package:movie_app/feature/watch_list/domain/entity/watch_list_entity.dart';

class WatchListItem extends StatelessWidget {
  const WatchListItem({super.key, required this.movie});
  final WatchlistMovieEntity movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
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
                Row(
                  children: [
                    SvgPicture.asset(AppAssets.star),
                    const SizedBox(width: 4),
                    Text(
                      movie.voteAverage.toString(),
                      style: AppFonts.titleMedium
                          .copyWith(color: AppColors.star, fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.ticket,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      movie.genres.isNotEmpty ? movie.genres.first : "Unknown",
                      style: AppFonts.bodyMedium
                          .copyWith(color: AppColors.offwhite, fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.calendarBlank,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      movie.releaseDate.substring(0, 4),
                      style: AppFonts.bodyMedium
                          .copyWith(color: AppColors.offwhite, fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.clock,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "${movie.runtime} minutes",
                      style: AppFonts.bodyMedium
                          .copyWith(color: AppColors.offwhite, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
