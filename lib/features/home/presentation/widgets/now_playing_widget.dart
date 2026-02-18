import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/common/widgets/shimmer_loading_widget.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/features/home/data/models/movie_dto.dart';
import 'package:movie_app/features/home/presentation/view_model/home_cubit.dart';
import 'package:movie_app/features/home/presentation/view_model/home_states.dart';
import 'package:movie_app/features/home/presentation/widgets/base_movie_section_widget.dart';

class NowPlayingWidget extends StatefulWidget {
  const NowPlayingWidget({super.key});

  @override
  State<NowPlayingWidget> createState() => _NowPlayingWidgetState();
}

class _NowPlayingWidgetState extends State<NowPlayingWidget> {
  static const double _cardHeight = 208.0;
  static const double _sectionHeight = 240.0;

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen: (previous, current) =>
          current is NowPlayingLoadingState ||
          current is NowPlayingSuccessState ||
          current is NowPlayingErrorState,
      builder: (context, state) {
        if (state is NowPlayingErrorState) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else if (state is NowPlayingSuccessState) {
          return _buildNowPlayingList(state.moviesResponseDto.results);
        } else {
          return _buildShimmerLoading();
        }
      },
    );
  }

  Widget _buildShimmerLoading() {
    return const ShimmerNowPlayingWidget();
  }

  Widget _buildNowPlayingList(List<MovieDto> movies) {
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
                    const SizedBox(width: 28),
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

  Widget _buildTappableCard(BuildContext context, MovieDto movie, int rank) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.movieDetail.withId(movie.id)),
      child: _NowPlayingCard(movie: movie, rank: rank),
    );
  }
}

class _NowPlayingCard extends StatelessWidget {
  final MovieDto movie;
  final int rank;

  const _NowPlayingCard({required this.movie, required this.rank});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BaseMovieSectionWidget.buildPosterImage(
            posterPath: movie.posterPath,
            width: 180,
            height: _NowPlayingWidgetState._cardHeight,
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
