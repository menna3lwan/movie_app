import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_assets.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/common_strings.dart';
import 'package:movie_app/core/theming/app_fonts.dart';
import 'package:movie_app/features/details/presentation/view_model/details_states.dart';
import 'package:movie_app/features/details/presentation/widgets/info_tag.dart';

class DescribtionWidget extends StatelessWidget {
  const DescribtionWidget({
    super.key,
    required this.detailsState,
  });

  final DetailsSuccessState detailsState;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InfoTag(
                    imageUrl: AppAssets.imgCalender,
                    label: detailsState.detailsEntity.releaseDate,
                  ),
                  const VerticalDivider(color: AppColors.grey),
                  InfoTag(
                    imageUrl: AppAssets.imgClock,
                    label: detailsState.detailsEntity.runtime
                        .toString(),
                  ),
                  const VerticalDivider(color: AppColors.grey),
                  InfoTag(
                    imageUrl: AppAssets.imgTicket,
                    label: detailsState
                        .detailsEntity
                        .genres
                        .first
                        .name,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Text(
              detailsState.detailsEntity.overview,
              style: AppFonts.bodyMedium,
            ),
            const SizedBox(height: 30),
            const Text(
              CommonStrings.similar,
              style: AppFonts.bodyMedium,
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}