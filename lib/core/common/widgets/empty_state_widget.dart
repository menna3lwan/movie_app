import 'package:flutter/material.dart';
import '../../constants/app_assets.dart';
import '../../constants/common_strings.dart';

class EmptyStateWidget extends StatelessWidget {
  final String message;
  final String? imagePath;
  final String supMassage;

  const EmptyStateWidget({
    super.key,
    this.message = CommonStrings.noResults,
    this.supMassage = CommonStrings.noResultsSubtitle,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath ?? AppAssets.imgFirstSearch,
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(height: 8),
            Text(
              supMassage,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.outlineVariant,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
