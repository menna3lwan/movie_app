import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_assets.dart';
import 'package:movie_app/core/constants/common_strings.dart';
import 'package:movie_app/core/theming/app_fonts.dart';

class WatchListEmptyWidget extends StatelessWidget {
  const WatchListEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.imgFolder,
            width: 150,
            height: 150,
          ),
          const SizedBox(height: 20),
          Text(CommonStrings.noMovie,
              style: AppFonts.titleLarge
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary)),
          const SizedBox(height: 8),
          Text(
            CommonStrings.noResultsSubtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.outlineVariant,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
