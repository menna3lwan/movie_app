import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../constants/app_colors.dart';

class ShimmerLoadingWidget extends StatelessWidget {
  final double cardWidth;
  final double cardHeight;
  final double titleWidth;
  final int itemCount;
  final bool showTitle;

  const ShimmerLoadingWidget({
    super.key,
    this.cardWidth = 120.0,
    this.cardHeight = 180.0,
    this.titleWidth = 80.0,
    this.itemCount = 4,
    this.showTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showTitle)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Container(
                width: titleWidth,
                height: 20,
                color: AppColors.surface,
              ),
            ),
          SizedBox(
            height: cardHeight,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: itemCount,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: cardWidth,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(color: AppColors.surface),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ShimmerGridLoadingWidget extends StatelessWidget {
  final int itemCount;
  final int crossAxisCount;
  final double childAspectRatio;

  const ShimmerGridLoadingWidget({
    super.key,
    this.itemCount = 6,
    this.crossAxisCount = 3,
    this.childAspectRatio = 0.7,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: childAspectRatio,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(color: AppColors.surface),
          );
        },
      ),
    );
  }
}

class ShimmerNowPlayingWidget extends StatelessWidget {
  final double cardHeight;
  final double sectionHeight;

  const ShimmerNowPlayingWidget({
    super.key,
    this.cardHeight = 210.0,
    this.sectionHeight = 250.0,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34.06),
        child: SizedBox(
          height: sectionHeight,
          child: Row(
            children: List.generate(
              2,
              (index) => Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 0 : 15.09,
                    right: index == 1 ? 0 : 15.09,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child:
                        Container(height: cardHeight, color: AppColors.surface),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
