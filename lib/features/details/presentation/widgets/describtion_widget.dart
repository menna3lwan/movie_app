import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_assets.dart';
import 'package:movie_app/core/constants/common_strings.dart';
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
                    imageUrl: AppAssets.calendarBlank,
                    label: detailsState.detailsEntity.releaseDate,
                  ),
                  VerticalDivider(
                      color: Theme.of(context).colorScheme.outlineVariant),
                  InfoTag(
                    imageUrl: AppAssets.clock,
                    label: detailsState.detailsEntity.runtime.toString(),
                  ),
                  VerticalDivider(
                      color: Theme.of(context).colorScheme.outlineVariant),
                  InfoTag(
                    imageUrl: AppAssets.ticket,
                    label: detailsState.detailsEntity.genres.isEmpty
                        ? CommonStrings.action
                        : detailsState.detailsEntity.genres.first.name,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Text(
              detailsState.detailsEntity.overview,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 30),
            Text(
              CommonStrings.similar,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
