import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/common/widgets/shimmer_loading_widget.dart';
<<<<<<< HEAD:lib/features/details/presentation/view/details_screen.dart
=======

>>>>>>> df95b67d114e919723fb677e6bafe9b35ef78d93:lib/feature/details/presentation/view/details_screen.dart
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/di/service_locator.dart';
<<<<<<< HEAD:lib/features/details/presentation/view/details_screen.dart
import 'package:movie_app/features/details/presentation/view_model/details_cubit.dart';
import 'package:movie_app/features/details/presentation/view_model/details_states.dart';
import 'package:movie_app/features/details/presentation/widgets/describtion_widget.dart';
import 'package:movie_app/features/details/presentation/widgets/movie_cover_widget.dart';
import 'package:movie_app/features/details/presentation/widgets/my_sliver_persistent_header.dart';
import 'package:movie_app/features/details/presentation/widgets/similar_grid.dart';
=======

import 'package:movie_app/feature/details/presentation/view_model/details_cubit.dart';
import 'package:movie_app/feature/details/presentation/view_model/details_states.dart';
import 'package:movie_app/feature/details/presentation/widgets/describtion_widget.dart';

import 'package:movie_app/feature/details/presentation/widgets/movie_cover_widget.dart';
import 'package:movie_app/feature/details/presentation/widgets/my_sliver_persistent_header.dart';
import 'package:movie_app/feature/details/presentation/widgets/similar_grid.dart';
import 'package:movie_app/feature/watch_list/presentation/view_model/cubit/watch_list_cubit.dart';
>>>>>>> df95b67d114e919723fb677e6bafe9b35ef78d93:lib/feature/details/presentation/view/details_screen.dart

class DetailsScreen extends StatefulWidget {
  final int movieDetailsId;
  final int movieSimilarsId;
  const DetailsScreen({
    super.key,
    required this.movieDetailsId,
    required this.movieSimilarsId,
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
          physics: const BouncingScrollPhysics(),
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
<<<<<<< HEAD:lib/features/details/presentation/view/details_screen.dart
                    child: Center(child: ShimmerLoadingWidget()),
=======
                    child: Center(child: MovieRowSkeleton()),
>>>>>>> df95b67d114e919723fb677e6bafe9b35ef78d93:lib/feature/details/presentation/view/details_screen.dart
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
<<<<<<< HEAD:lib/features/details/presentation/view/details_screen.dart
                    child: Center(child: ShimmerLoadingWidget()),
=======
                    child: Center(child: ShimmerGridLoadingWidget()),
>>>>>>> df95b67d114e919723fb677e6bafe9b35ef78d93:lib/feature/details/presentation/view/details_screen.dart
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
                        style: const TextStyle(color: AppColors.error),
                      ),
                    ),
                  );
                } else if (similarState is SimilarSuccessState) {
                  return SimilarGrid(similarState: similarState);
                } else {
                  return const SliverToBoxAdapter(
<<<<<<< HEAD:lib/features/details/presentation/view/details_screen.dart
                    child: Center(child: ShimmerLoadingWidget()),
=======
                    child: Center(child: ShimmerGridLoadingWidget()),
>>>>>>> df95b67d114e919723fb677e6bafe9b35ef78d93:lib/feature/details/presentation/view/details_screen.dart
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
