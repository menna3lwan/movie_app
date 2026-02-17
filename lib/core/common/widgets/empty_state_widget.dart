import 'package:flutter/material.dart';

import '../../constants/app_assets.dart';
import '../../constants/common_strings.dart';

class EmptyStateWidget extends StatelessWidget {
  final String message;
  final String? imagePath;

  const EmptyStateWidget({
    super.key,
    this.message = CommonStrings.noResults,
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
              imagePath ?? AppAssets.imgNoResults,
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
