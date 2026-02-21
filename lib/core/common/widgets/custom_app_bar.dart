import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final Widget? leading;
  final bool? centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = true,
    this.leading,
    this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      elevation: 0,
      automaticallyImplyLeading: showBackButton,
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
      actions: actions,
      leading: leading,
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
