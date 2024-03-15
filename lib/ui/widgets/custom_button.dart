import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/extensions/context_extension.dart';
import 'package:task/core/res/app_sizes.dart';
import 'package:task/core/responsive/responsive_helper.dart';
import 'package:task/core/theming/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onPressed,
    required this.text,
    super.key,
    this.width,
    this.radius,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.textStyle,
    this.elevation,
    this.side,
    this.icon,
  });

  final void Function() onPressed;
  final String text;
  final double? width;
  final double? radius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final double? elevation;
  final BorderSide? side;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding ??
              EdgeInsets.symmetric(
                horizontal: 60.w,
                vertical:
                    getValueForScreenType(context, mobile: 18.h, tablet: 22.h),
              ),
          backgroundColor: backgroundColor ?? context.colorScheme.primary,
          foregroundColor: foregroundColor ?? Colors.white,
          elevation: elevation ?? 0.0,
          shadowColor: context.colorScheme.shadow,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          textStyle: textStyle ?? TextStyles.font14Medium(Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 12.r),
          ),
          side: side,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
            ),
            if (icon != null) ...[
              SizedBox(
                width: 12.w,
              ),
              icon!,
            ],
          ],
        ),
      ),
    );
  }
}
