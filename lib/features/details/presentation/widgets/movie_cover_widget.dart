import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/common/widgets/app_cached_image.dart';
import 'package:movie_app/core/constants/app_assets.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/network/api_urls.dart';
import 'package:movie_app/core/theming/app_fonts.dart';
import 'package:movie_app/features/details/presentation/view_model/details_states.dart';

class MovieCoverWidget extends StatelessWidget {
  const MovieCoverWidget({super.key, required this.detailsState});

  final DetailsSuccessState detailsState;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      floating: true,
      leading: const SizedBox(),
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Stack(
          alignment: Alignment.topCenter,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(16),
                      bottomStart: Radius.circular(16),
                    ),
                    child: AppCachedImage(
                      imageUrl: detailsState.detailsEntity.backdropPath.isEmpty
                          ? AppAssets.dummyImage
                          : '${ApiUrls.prefixImageUrl}${detailsState.detailsEntity.backdropPath}',
                    )),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.lightDark.withValues(alpha: .8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(AppAssets.star),
                        const SizedBox(width: 5),
                        Text(
                          detailsState.detailsEntity.voteAverage
                              .toStringAsPrecision(2),
                          style: AppFonts.labelLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: AppCachedImage(
                            imageUrl: detailsState
                                    .detailsEntity.posterPath.isEmpty
                                ? AppAssets.dummyImage
                                : '${ApiUrls.prefixImageUrl}${detailsState.detailsEntity.posterPath}',
                            width: 110,
                            fit: BoxFit.cover,
                            height: 165,
                          )),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text(
                            detailsState.detailsEntity.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
