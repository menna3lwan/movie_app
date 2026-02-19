import 'package:flutter/material.dart';
<<<<<<< HEAD:lib/features/details/presentation/widgets/describtion_widget.dart
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/common_strings.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../features/details/presentation/view_model/details_states.dart';
import '../../../../features/details/presentation/widgets/info_tag.dart';
=======
import 'package:movie_app/core/constants/app_assets.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/common_strings.dart';
import 'package:movie_app/core/theming/app_fonts.dart';
import 'package:movie_app/feature/details/presentation/view_model/details_states.dart';
import 'package:movie_app/feature/details/presentation/widgets/info_tag.dart';
>>>>>>> df95b67d114e919723fb677e6bafe9b35ef78d93:lib/feature/details/presentation/widgets/describtion_widget.dart

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
                    imageUrl: AppAssets.calendarBlank,
                    label: detailsState.detailsEntity.releaseDate,
                  ),
                  const VerticalDivider(color: AppColors.grey),
                  InfoTag(
                    imageUrl: AppAssets.clock,
<<<<<<< HEAD:lib/features/details/presentation/widgets/describtion_widget.dart
                    label: detailsState.detailsEntity.runtime.toString(),
=======
                    label: detailsState.detailsEntity.runtime
                        .toString(),
>>>>>>> df95b67d114e919723fb677e6bafe9b35ef78d93:lib/feature/details/presentation/widgets/describtion_widget.dart
                  ),
                  const VerticalDivider(color: AppColors.grey),
                  InfoTag(
                    imageUrl: AppAssets.ticket,
<<<<<<< HEAD:lib/features/details/presentation/widgets/describtion_widget.dart
                    label: detailsState.detailsEntity.genres.isEmpty
                        ? CommonStrings.action
                        : detailsState.detailsEntity.genres.first.name,
=======
                    label: detailsState
                        .detailsEntity
                        .genres
                        .first
                        .name,
>>>>>>> df95b67d114e919723fb677e6bafe9b35ef78d93:lib/feature/details/presentation/widgets/describtion_widget.dart
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
