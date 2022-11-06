import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KsImage {
  const KsImage._();

  static Widget assetPNG(
    String name, {
    Key? key,
    String? folder,
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
  }) {
    return Image.asset(
      'assets/images${folder != null ? '/$folder' : ''}/$name.png',
      key: key,
      width: width,
      height: height,
      fit: fit,
      color: color,
    );
  }

  static Widget assetSVG(
    String name, {
    Key? key,
    String? folder,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Color? color,
  }) {
    return SvgPicture.asset(
      'assets/images${folder != null ? '/$folder' : ''}/$name.svg',
      key: key,
      width: width,
      height: height,
      fit: fit,
      color: color,
    );
  }

  static Widget networkImage(
    String url, {
    double height = double.infinity,
    double width = double.infinity,
    Color? backgroundColor,
    Widget? placeholder,
    BorderRadius? borderRadius,
    BoxFit? fit,
    Duration? fadeInDuration,
    Alignment? alignment,
    Widget? errorWidget,
  }) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: Container(
        width: width,
        height: height,
        color: backgroundColor ?? Colors.transparent,
        child: CachedNetworkImage(
          imageUrl: url,
          progressIndicatorBuilder:
              placeholder != null ? (_, __, ___) => placeholder : null,
          errorWidget: (context, url, error) {
            return Center(
              child: errorWidget ??
                  const Icon(
                    FontAwesomeIcons.circleExclamation,
                    size: 24,
                    color: Color(0xffb00020),
                  ),
            );
          },
          cacheKey: url,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment ?? Alignment.center,
          fadeInDuration: fadeInDuration ?? const Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
