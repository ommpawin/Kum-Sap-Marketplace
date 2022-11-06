import 'package:flutter/material.dart';
import 'package:kumsap_marketplace/style/ksFonts.dart';

class KsSliverAppBar extends StatelessWidget {
  final String title;
  final double expandedHeight;
  
  const KsSliverAppBar({
    super.key,
    required this.title,
    this.expandedHeight = 96,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: expandedHeight,
      centerTitle: false,
      surfaceTintColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: KsFontWeight.bold,
              ),
        ),
        centerTitle: false,
      ),
    );
  }
}
