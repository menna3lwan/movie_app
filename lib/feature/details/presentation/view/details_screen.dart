import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/common/widgets/shimmer_loading_widget.dart';

import 'package:movie_app/core/constants/app_colors.dart';

import 'package:movie_app/core/di/service_locator.dart';

import 'package:movie_app/feature/details/presentation/view_model/details_cubit.dart';
import 'package:movie_app/feature/details/presentation/view_model/details_states.dart';
import 'package:movie_app/feature/details/presentation/widgets/describtion_widget.dart';

import 'package:movie_app/feature/details/presentation/widgets/movie_cover_widget.dart';
import 'package:movie_app/feature/details/presentation/widgets/my_sliver_persistent_header.dart';
import 'package:movie_app/feature/details/presentation/widgets/similar_grid.dart';
import 'package:movie_app/feature/watch_list/presentation/view_model/cubit/watch_list_cubit.dart';

class DetailsScreen extends StatefulWidget {
  final int movieDetailsId;
  final int movieSimilarsId;
  const DetailsScreen({
    super.key,
    this.movieDetailsId = 1419406,
    this.movieSimilarsId = 1419406,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsCubit cubit;
  late WatchlistCubit watchlistCubit;

  @override
  void initState() {
    super.initState();
    cubit = getIt<DetailsCubit>()
      ..intent(GetSimilarIntent(widget.movieSimilarsId))
      ..intent(GetDetailsIntent(widget.movieDetailsId));
    watchlistCubit = getIt<WatchlistCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MySliverPersistentHeader(
                cubit: cubit,
                watchlistCubit: watchlistCubit,
              ),
              pinned: true,
            ),
            BlocBuilder<DetailsCubit, DetailsStates>(
              bloc: cubit,
              builder: (context, state) {
                final detailsState =
                    (state as CombinedDetailsState).detailsState;
                if (detailsState is DetailsErrorState) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text(detailsState.message)),
                  );
                } else if (detailsState is DetailsSuccessState) {
                  return MovieCoverWidget(detailsState: detailsState);
                } else {
                  return const SliverToBoxAdapter(
                    child: Center(child: MovieRowSkeleton()),
                  );
                }
              },
            ),
            BlocBuilder<DetailsCubit, DetailsStates>(
              bloc: cubit,
              builder: (context, state) {
                final detailsState =
                    (state as CombinedDetailsState).detailsState;
                if (detailsState is DetailsErrorState) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        detailsState.message,
                        style: const TextStyle(color: AppColors.error),
                      ),
                    ),
                  );
                } else if (detailsState is DetailsSuccessState) {
                  return DescribtionWidget(detailsState: detailsState);
                } else {
                  return const SliverToBoxAdapter(
                    child: Center(child: ShimmerGridLoadingWidget()),
                  );
                }
              },
            ),
            BlocBuilder<DetailsCubit, DetailsStates>(
              bloc: cubit,
              builder: (context, state) {
                final similarState =
                    (state as CombinedDetailsState).similarState;
                if (similarState is SimilarErrorState) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        similarState.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                } else if (similarState is SimilarSuccessState) {
                  return SimilarGrid(similarState: similarState);
                } else {
                  return const SliverToBoxAdapter(
                    child: Center(child: ShimmerGridLoadingWidget()),
                  );
                }
              },
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      ),
    );
  }
}
