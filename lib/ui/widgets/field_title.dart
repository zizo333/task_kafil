import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theming/app_colors.dart';
import 'package:task/core/theming/font_weight_helper.dart';
import 'package:task/core/theming/text_styles.dart';

class FieldTitle extends StatelessWidget {
  const FieldTitle({
    required this.title,
    this.child,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.inset,
    super.key,
  });

  final String title;
  final Widget? child;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? inset;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TStyle(
            fontSize: fontSize ?? 12.sp,
            color: color ?? AppColors.gray500,
            fontWeight: fontWeight ?? FontWeightHelper.medium,
          ),
        ),
        if (child != null) ...[
          SizedBox(
            height: inset ?? 8.h,
          ),
          child!,
        ],
      ],
    );
  }
}
