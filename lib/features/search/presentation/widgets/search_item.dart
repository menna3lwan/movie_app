import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_assets.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/common_strings.dart';
import 'package:movie_app/core/network/api_urls.dart';
import 'package:movie_app/features/details/presentation/view/details_screen.dart';
import 'package:movie_app/features/search/domain/entity/movie_entity.dart';

class SearchItem extends StatelessWidget {
  final SearchEntity movie;

  const SearchItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final imageUrl = movie.posterPath.isNotEmpty
        ? '${ApiUrls.prefixImageUrl}${movie.posterPath}'
        : AppAssets.dummyImage;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(
                      movieDetailsId: movie.id,
                      movieSimilarsId: movie.id,
                    )));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              fadeOutDuration: const Duration(milliseconds: 50),
              imageUrl: imageUrl,
              width: 110,
              height: 160,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(
                color: Theme.of(context).colorScheme.outlineVariant,
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (_, __, ___) => _buildPlaceholder(),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Icon(Icons.star,
                          color: Theme.of(context).colorScheme.primaryContainer,
                          size: 16),
                      const SizedBox(width: 4),
                      Text(
                        movie.voteAverage.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.language,
                        //!=================== icons colors ===============================
                        color: Theme.of(context).colorScheme.onError,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        movie.originalLanguage,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        movie.releaseDate.isNotEmpty
                            ? movie.releaseDate.split('-')[0]
                            : CommonStrings.notAvailable,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.description,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          movie.overview,
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: 110,
      height: 160,
      color: Colors.grey[800],
      child: const Icon(Icons.movie, color: AppColorsDark.textSecondary),
    );
  }
}
