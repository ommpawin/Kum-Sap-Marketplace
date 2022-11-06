import 'package:flutter/material.dart';
import 'package:kumsap_marketplace/style/ksFonts.dart';

class KsAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;

  const KsAppBar({super.key, this.title,});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: title != null ? Text(
          title!,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: KsFontWeight.bold,
              ),
        ) : null,
        titleSpacing: 0,
        centerTitle: false,
        surfaceTintColor: Colors.white
      );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
