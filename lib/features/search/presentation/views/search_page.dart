import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/common/widgets/app_error_widget.dart';
import 'package:movie_app/core/common/widgets/custom_app_bar.dart';
import 'package:movie_app/core/common/widgets/empty_state_widget.dart';
import 'package:movie_app/core/common/widgets/loading_indicator.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/common_strings.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/features/search/presentation/view_model/search_cubit.dart';
import 'package:movie_app/features/search/presentation/view_model/search_states.dart';
import 'package:movie_app/features/search/presentation/widgets/search_item.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt()),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: const CustomAppBar(
          title: CommonStrings.search,
          showBackButton: false,
        ),
        body: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    onChanged: (query) {
                      context.read<SearchCubit>().searchMovies(query);
                    },
                    style: const TextStyle(color: AppColors.textPrimary),
                    decoration: InputDecoration(
                      hintText: CommonStrings.searchHint,
                      hintStyle:
                          const TextStyle(color: AppColors.textSecondary),
                      suffixIcon: const Icon(
                        Icons.search,
                        color: AppColors.textSecondary,
                      ),
                      filled: true,
                      fillColor: AppColors.surface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: BlocBuilder<SearchCubit, SearchStates>(
                      builder: (context, state) {
                        if (state is SearchLoadingState) {
                          return const LoadingIndicator();
                        }

                        if (state is SearchErrorState) {
                          return AppErrorWidget(
                            message: state.message,
                            onRetry: () {},
                          );
                        }

                        // 🟢 Success
                        if (state is SearchSuccessState) {
                          final movies = state.movies;

                          /// لو النتيجة فاضية، نعرض رسالة "No results"

                          if (movies.isEmpty) {
                            return const EmptyStateWidget(
                              message: CommonStrings.noResultsTitle,
                              supMassage: CommonStrings.noResultsSubtitle,
                              // imagePath: AppAssets.imgSearch, // غيرت الصوره بس الاسيتس عندي فيها مشكله
                            );
                          }

                          return ScrollConfiguration(
                            behavior: const ScrollBehavior().copyWith(),
                            child: ListView.separated(
                              itemCount: movies.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 16),
                              itemBuilder: (context, index) {
                                return SearchItem(movie: movies[index]);
                              },
                            ),
                          );
                        }

                        /// الحالة الافتراضية (لما يكون لسه ما كتبش حاجة أو مسح كل حاجة)

                        return const EmptyStateWidget(
                          // imagePath: AppAssets.imgFirstSearch,

                          message: CommonStrings.searchHint,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
