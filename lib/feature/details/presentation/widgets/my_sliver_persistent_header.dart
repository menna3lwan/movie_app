import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/common/widgets/custom_app_bar.dart';
import 'package:movie_app/core/constants/app_assets.dart';
import 'package:movie_app/core/network/api_urls.dart';
import 'package:movie_app/feature/details/presentation/view_model/details_cubit.dart';
import 'package:movie_app/feature/details/presentation/view_model/details_states.dart';
import 'package:movie_app/feature/watch_list/domain/entity/watch_list_entity.dart';
import 'package:movie_app/feature/watch_list/presentation/view_model/cubit/watch_list_cubit.dart';
import 'package:movie_app/feature/watch_list/presentation/view_model/cubit/watch_list_state.dart';

class MySliverPersistentHeader extends SliverPersistentHeaderDelegate {
  final WatchlistCubit watchlistCubit;
  final DetailsCubit cubit;

  MySliverPersistentHeader({
    required this.watchlistCubit,
    required this.cubit,
  });
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return CustomAppBar(
      title: "Details",
      actions: [
        BlocBuilder<WatchlistCubit, WatchlistState>(
            bloc: watchlistCubit,
            builder: (context, state) {
              final detailsState = cubit.state;

              bool isSaved = false;
              WatchlistMovieEntity? movie;

              if (detailsState is CombinedDetailsState &&
                  detailsState.detailsState is DetailsSuccessState) {
                final details =
                    detailsState.detailsState as DetailsSuccessState;

                final movieId = details.detailsEntity.id;

                isSaved = watchlistCubit.isMovieInWatchlist(movieId);

                movie = WatchlistMovieEntity(
                  id: details.detailsEntity.id,
                  title: details.detailsEntity.title,
                  posterPath:
                      ApiUrls.prefixImageUrl + details.detailsEntity.posterPath,
                  voteAverage: details.detailsEntity.voteAverage,
                  releaseDate: details.detailsEntity.releaseDate,
                  genres:
                      details.detailsEntity.genres.map((g) => g.name).toList(),
                  runtime: details.detailsEntity.runtime,
                );
              }

              return IconButton(
                icon: isSaved
                    ? SvgPicture.asset(
                        AppAssets.YellowBookMark,
                      )
                    : SvgPicture.asset(AppAssets.bookMark),
                onPressed: movie == null
                    ? null
                    : () {
                        watchlistCubit.intent(ToggleWatchlistEvent(movie!));
                      },
              );
            }),
      ],
    );
  }

  @override
  double get maxExtent => 110;

  @override
  double get minExtent => 110;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
