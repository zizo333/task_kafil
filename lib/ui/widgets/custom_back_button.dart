import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/core/extensions/context_extension.dart';
import 'package:task/core/res/app_media.dart';
import 'package:task/core/responsive/responsive_helper.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    this.onTap,
    this.color,
    super.key,
  });

  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap ?? context.pop,
      splashColor: Colors.white,
      visualDensity: VisualDensity.comfortable,
      icon: SvgPicture.asset(
        AppSvgs.back,
        width: getValueForScreenType(
          context,
          mobile: 8.w,
          tablet: 8.w,
        ),
        height: getValueForScreenType(
          context,
          mobile: 15.h,
          tablet: 15.h,
        ),
      ),
    );
  }
}
