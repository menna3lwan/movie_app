import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoTag extends StatelessWidget {
  final String imageUrl;
  final String label;
  const InfoTag({super.key, required this.imageUrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SvgPicture.asset(
            imageUrl,
            width: 16,
            height: 16,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.outlineVariant,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: Theme.of(context).colorScheme.outlineVariant,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
