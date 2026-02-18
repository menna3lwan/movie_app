import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/common/widgets/shimmer_loading_widget.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/feature/watch_list/presentation/view_model/cubit/watch_list_cubit.dart';
import 'package:movie_app/feature/watch_list/presentation/view_model/cubit/watch_list_state.dart';
import 'package:movie_app/feature/watch_list/presentation/widgets/watch_list_empty_widget.dart';
import 'package:movie_app/feature/watch_list/presentation/widgets/watch_list_item_widget.dart';

class WatchListView extends StatefulWidget {
  const WatchListView({super.key});
  static late WatchlistCubit cubit;

  @override
  State<WatchListView> createState() => _WatchListViewState();
}

class _WatchListViewState extends State<WatchListView> {
  late final WatchlistCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<WatchlistCubit>();

    WatchListView.cubit = _cubit;

    _cubit.intent(LoadWatchlistEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocBuilder<WatchlistCubit, WatchlistState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is WatchlistEmpty) {
            return WatchListEmptyWidget();
          }
          if (state is WatchlistSuccess) {
            final movies = state.movies;
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              itemBuilder: (context, index) {
                final movie = movies[index];
                return WatchListItem(movie: movie);
              },
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemCount: movies.length,
            );
          }
          return MovieRowSkeleton();
        },
      ),
    );
  }
}
