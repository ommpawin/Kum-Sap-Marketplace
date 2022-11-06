import 'package:flutter/material.dart';
import 'package:kumsap_marketplace/style/ksFonts.dart';

class KsEmptyState extends StatelessWidget {
  final IconData icon;
  final String? title;

  const KsEmptyState({
    super.key,
    required this.icon,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Theme.of(context).colorScheme.secondary,
            size: 70,
          ),
          if (title != null)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title ?? '',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: KsFontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
