import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/res/app_sizes.dart';
import 'package:task/ui/widgets/custom_loading.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    required this.imageUrl,
    this.height,
    this.width,
    this.errorIconSize,
    this.radius,
    this.fit,
    this.errorWidget,
    this.enableTap = true,
    super.key,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final double? errorIconSize;
  final double? radius;
  final BoxFit? fit;
  final Widget? errorWidget;
  final bool enableTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? AppSizes.radius.r),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        placeholder: (_, __) => const ImageLoading(),
        errorWidget: (_, __, ___) =>
            errorWidget ??
            Icon(
              Icons.image,
              size: errorIconSize ?? 100.r,
              color: Colors.black38,
            ),
      ),
    );
  }
}
