import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/theming/app_fonts.dart';

class InfoRowWidget extends StatelessWidget {
  const InfoRowWidget({
    super.key,
    required this.icon,
    required this.text,
    this.color,
    this.fontSize = 12,
  });

  final String icon;
  final String text;
  final Color? color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        const SizedBox(width: 4),
        Text(
          text,
          style: AppFonts.bodyMedium.copyWith(
            color: color ?? Theme.of(context).colorScheme.onInverseSurface,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
