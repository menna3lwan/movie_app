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
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
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
              separatorBuilder: (context, index) => const SizedBox(width: 12),
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
                    child: Container(
                      height: cardHeight,
                      color: AppColors.surface,
                    ),
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

class MovieRowSkeleton extends StatelessWidget {
  const MovieRowSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 95,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 16,
                        width: double.infinity,
                        color: AppColors.surface,
                      ),
                      const SizedBox(height: 8),
                      Container(
                          height: 16, width: 100, color: AppColors.surface),
                      const SizedBox(height: 14),
                      Container(
                          height: 12, width: 50, color: AppColors.surface),
                      const SizedBox(height: 8),
                      Container(
                          height: 12, width: 80, color: AppColors.surface),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 95,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 16,
                        width: double.infinity,
                        color: AppColors.surface,
                      ),
                      const SizedBox(height: 8),
                      Container(
                          height: 16, width: 100, color: AppColors.surface),
                      const SizedBox(height: 14),
                      Container(
                          height: 12, width: 50, color: AppColors.surface),
                      const SizedBox(height: 8),
                      Container(
                          height: 12, width: 80, color: AppColors.surface),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 95,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 16,
                        width: double.infinity,
                        color: AppColors.surface,
                      ),
                      const SizedBox(height: 8),
                      Container(
                          height: 16, width: 100, color: AppColors.surface),
                      const SizedBox(height: 14),
                      Container(
                          height: 12, width: 50, color: AppColors.surface),
                      const SizedBox(height: 8),
                      Container(
                          height: 12, width: 80, color: AppColors.surface),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MovieCoverSkeleton extends StatelessWidget {
  const MovieCoverSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(16),
                  bottomStart: Radius.circular(16),
                ),
                child: Container(
                  height: 280,
                  width: double.infinity,
                  color: AppColors.surface,
                ),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                child: Container(
                  width: 60,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(8),
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
                      child: Container(
                        width: 110,
                        height: 165,
                        color: AppColors.surface,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 20,
                              width: double.infinity,
                              color: AppColors.surface,
                            ),
                            const SizedBox(height: 8),
                            Container(
                              height: 20,
                              width: 150,
                              color: AppColors.surface,
                            ),
                          ],
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
    );
  }
}

class DescriptionSkeleton extends StatelessWidget {
  const DescriptionSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Skeletonizer(
        enabled: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _tagSkeleton(),
                  const SizedBox(width: 12),
                  const VerticalDivider(color: AppColors.grey),
                  const SizedBox(width: 12),
                  _tagSkeleton(),
                  const SizedBox(width: 12),
                  const VerticalDivider(color: AppColors.grey),
                  const SizedBox(width: 12),
                  _tagSkeleton(),
                ],
              ),
              const SizedBox(height: 25),
              _line(width: double.infinity),
              const SizedBox(height: 8),
              _line(width: double.infinity),
              const SizedBox(height: 8),
              _line(width: MediaQuery.of(context).size.width * 0.6),
              const SizedBox(height: 30),
              _line(width: 80, height: 16),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tagSkeleton() {
    return Container(
      width: 90,
      height: 24,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _line({required double width, double height = 14}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
