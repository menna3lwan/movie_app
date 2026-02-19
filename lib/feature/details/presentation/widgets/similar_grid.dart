import 'package:flutter/material.dart';
<<<<<<< HEAD:lib/features/details/presentation/widgets/similar_grid.dart
import 'package:movie_app/features/details/presentation/view/details_screen.dart';
import '../../../../core/common/widgets/empty_state_widget.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/network/api_urls.dart';
import '../../../../features/details/presentation/view_model/details_states.dart';
=======
import 'package:movie_app/core/common/widgets/empty_state_widget.dart';
import 'package:movie_app/core/constants/app_assets.dart';
import 'package:movie_app/core/network/api_urls.dart';
import 'package:movie_app/feature/details/presentation/view_model/details_states.dart';
>>>>>>> df95b67d114e919723fb677e6bafe9b35ef78d93:lib/feature/details/presentation/widgets/similar_grid.dart

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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 0.7,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            movieDetailsId:
                                similarState.similarEntity.results[index].id,
                            movieSimilarsId:
                                similarState.similarEntity.results[index].id,
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        similarState
                                .similarEntity.results[index].posterPath.isEmpty
                            ? AppAssets.dummyImage
                            : '${ApiUrls.prefixImageUrl}${similarState.similarEntity.results[index].posterPath}',
                        width: 100,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                childCount: similarState.similarEntity.results.length,
              ),
            ),
    );
  }
}
