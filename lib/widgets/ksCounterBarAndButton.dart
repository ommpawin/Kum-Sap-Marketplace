import 'package:flutter/material.dart';
import 'package:kumsap_marketplace/style/ksFonts.dart';

enum ButtonSide {
  LEFT,
  RIGHT,
}

class KsCounterBarAndButton extends StatelessWidget {
  final int count;
  final VoidCallback? onTapDecrease;
  final VoidCallback? onTapIncrease;
  final bool disable;

  const KsCounterBarAndButton({
    super.key,
    required this.count,
    this.onTapDecrease,
    this.onTapIncrease,
    this.disable = false,
  });

  Widget _button(
    BuildContext context,
    ButtonSide buttonSide,
    String text, {
    VoidCallback? onTap,
    bool disable = false,
  }) {
    return InkWell(
      onTap: !disable ? onTap : null,
      borderRadius: buttonSide == ButtonSide.LEFT
          ? const BorderRadius.only(
              topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))
          : const BorderRadius.only(
              topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
      child: Opacity(
        opacity: !disable ? 1.0 : 0.3,
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).colorScheme.onSecondaryContainer),
            borderRadius: buttonSide == ButtonSide.LEFT
                ? const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const int limitCount = 10;

    return Flexible(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _button(
            context,
            ButtonSide.LEFT,
            '-',
            disable: disable || count <= 1,
            onTap: onTapDecrease,
          ),
          Opacity(
            opacity: !disable ? 1 : 0.3,
            child: Container(
              height: 30,
              width: 45,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Theme.of(context).colorScheme.onSecondaryContainer,),
                  bottom: BorderSide(color: Theme.of(context).colorScheme.onSecondaryContainer,),
                  left: count == 1 ? BorderSide(color: Theme.of(context).colorScheme.onSecondaryContainer,) : BorderSide.none,
                  right: count == limitCount ? BorderSide(color: Theme.of(context).colorScheme.onSecondaryContainer,) : BorderSide.none,
                ),
                color: Colors.white,
              ),
              alignment: Alignment.center,
              child: Text(
                count.toString(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: KsFontWeight.bold,
                    ),
                maxLines: 1,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          _button(
            context,
            ButtonSide.RIGHT,
            '+',
            disable: disable || count >= limitCount,
            onTap: onTapIncrease,
          ),
        ],
      ),
    );
  }
}
