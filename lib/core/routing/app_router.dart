import 'package:flutter/material.dart';

class AppRouter {}

// ignore: unused_element
class _PlaceholderPage extends StatelessWidget {
  final String title;
  const _PlaceholderPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.headlineMedium?.copyWith(color: Colors.grey),
      ),
    );
  }
}
