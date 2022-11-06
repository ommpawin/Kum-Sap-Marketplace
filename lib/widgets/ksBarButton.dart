import 'package:flutter/material.dart';

class KsBarButton extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Size maximumSize;
  final bool disable;
  final VoidCallback? onPressed;

  const KsBarButton({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(vertical: 14),
    this.maximumSize = const Size(378, double.infinity),
    this.disable = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !disable ? onPressed : null,
      style: ElevatedButton.styleFrom(
        padding: padding,
        maximumSize: maximumSize,
      ),
      child: child,
    );
  }
}
