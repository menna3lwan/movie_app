import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_assets.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/common_strings.dart';
import 'package:movie_app/core/theming/app_fonts.dart';

class WatchListEmptyWidget extends StatelessWidget {
  const WatchListEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.imgFolder,
              width: 76,
              height: 76,
            ),
            const SizedBox(height: 20),
            Text(CommonStrings.noMovie,
                style:
                    AppFonts.titleMedium.copyWith(color: AppColors.whiteGray)),
            const SizedBox(height: 8),
            Text(
              CommonStrings.noResultsSubtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
