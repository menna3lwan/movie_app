import 'package:flutter/material.dart';
import 'package:movie_app/core/theming/app_fonts.dart';

import '../../constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final Widget? leading;
  final bool? isTrue;
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = true,
    this.leading,
    this.isTrue
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: AppFonts.appBarTitle),
      backgroundColor: AppColors.background,
      elevation: 0,
      automaticallyImplyLeading: showBackButton,
      iconTheme: const IconThemeData(color: AppColors.textPrimary),
      actions: actions,
      leading: leading,
      centerTitle: isTrue,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
