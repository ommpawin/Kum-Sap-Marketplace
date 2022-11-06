import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KsSavedButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double size;
  final bool isSaved;

  const KsSavedButton({
    super.key,
    this.onTap,
    this.size = 18,
    this.isSaved = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(80),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          splashColor: isSaved
              ? Theme.of(context).colorScheme.onPrimaryContainer
              : Theme.of(context).colorScheme.error,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(80),
            ),
            child: Icon(
              isSaved ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
              size: size,
              color: isSaved ? Theme.of(context).colorScheme.error : null,
            ),
          ),
        ),
      ),
    );
  }
}
