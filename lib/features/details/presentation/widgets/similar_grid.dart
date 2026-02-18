import 'package:flutter/material.dart';
import 'package:movie_app/core/common/widgets/empty_state_widget.dart';
import 'package:movie_app/core/constants/app_assets.dart';
import 'package:movie_app/core/network/api_urls.dart';
import 'package:movie_app/features/details/presentation/view_model/details_states.dart';

class SimilarGrid extends StatelessWidget {
  const SimilarGrid({
    super.key,
    required this.similarState,
  });

  final SimilarSuccessState similarState;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: similarState.similarEntity.results.isEmpty
          ? SliverToBoxAdapter(
              child: Center(
                child: EmptyStateWidget(
                  imagePath: AppAssets.imgNoResults,
                ),
              ),
            )
          : SliverGrid(
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.7,
                  ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      similarState
                              .similarEntity
                              .results[index]
                              .posterPath
                              .isEmpty
                          ? AppAssets.dummyImage
                          : '${ApiUrls.prefixImageUrl}${similarState.similarEntity.results[index].posterPath}',
                      width: 100,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                childCount:
                    similarState.similarEntity.results.length,
              ),
            ),
    );
  }
}