import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/shimmer_loading_widget.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/network/api_urls.dart';
import '../../../../core/routing/routes.dart';
import '../../domain/entity/movie_entity.dart';

class TopRatedWidget extends StatefulWidget {
  final List<MovieEntity>? movies;
  final String? error;

  const TopRatedWidget({super.key, required this.movies, required this.error});

  @override
  State<TopRatedWidget> createState() => _TopRatedWidgetState();
}

class _TopRatedWidgetState extends State<TopRatedWidget> {
  static const double _cardHeight = 208.0;
  static const double _sectionHeight = 240.0;

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.error != null) {
      return Center(
        child: Text(widget.error!, style: const TextStyle(color: Colors.red)),
      );
    }

    if (widget.movies != null) {
      return _buildTopRatedList(widget.movies!);
    }

    return const ShimmerNowPlayingWidget();
  }

  Widget _buildTopRatedList(List<MovieEntity> movies) {
    if (movies.isEmpty) return const SizedBox.shrink();
    final displayMovies = movies.length > 10 ? movies.sublist(0, 10) : movies;
    final pageCount = (displayMovies.length / 2).ceil();

    return Column(
      children: [
        SizedBox(
          height: _sectionHeight,
          child: PageView.builder(
            itemCount: pageCount,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, pageIndex) {
              final firstIndex = pageIndex * 2;
              final secondIndex = firstIndex + 1;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 31.06),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildTappableCard(
                        context,
                        displayMovies[firstIndex],
                        firstIndex + 1,
                      ),
                    ),
                    const SizedBox(width: 31),
                    if (secondIndex < displayMovies.length)
                      Expanded(
                        child: _buildTappableCard(
                          context,
                          displayMovies[secondIndex],
                          secondIndex + 1,
                        ),
                      )
                    else
                      const Expanded(child: SizedBox()),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        _PageIndicator(pageCount: pageCount, currentPage: _currentPage),
      ],
    );
  }

  Widget _buildTappableCard(BuildContext context, MovieEntity movie, int rank) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.movieDetail.withId(movie.id)),
      child: _TopRatedCard(movie: movie, rank: rank),
    );
  }
}

class _TopRatedCard extends StatelessWidget {
  final MovieEntity movie;
  final int rank;

  const _TopRatedCard({required this.movie, required this.rank});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: movie.posterPath != null
              ? Image.network(
                  '${ApiUrls.prefixImageUrl}${movie.posterPath}',
                  width: 180,
                  height: _TopRatedWidgetState._cardHeight,
                  fit: BoxFit.cover,
                )
              : Container(
                  width: 180,
                  height: _TopRatedWidgetState._cardHeight,
                  color: AppColors.surface,
                  child: const Icon(Icons.movie, color: Colors.grey),
                ),
        ),
        Positioned(bottom: -30, left: 6, child: _StrokedNumber(rank: rank)),
      ],
    );
  }
}

class _StrokedNumber extends StatelessWidget {
  final int rank;

  const _StrokedNumber({required this.rank});

  static const _style = TextStyle(
    fontSize: 96,
    fontWeight: FontWeight.w600,
    height: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          '$rank',
          style: _style.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = AppColors.secondary,
          ),
        ),
        Text('$rank', style: _style.copyWith(color: AppColors.background)),
      ],
    );
  }
}

class _PageIndicator extends StatelessWidget {
  final int pageCount;
  final int currentPage;

  const _PageIndicator({required this.pageCount, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        final isActive = index == currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: isActive ? 24 : 8,
          height: 10,
          decoration: BoxDecoration(
            color: isActive ? AppColors.secondary : AppColors.surface,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
