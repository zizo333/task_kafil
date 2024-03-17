import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/res/app_fonts.dart';
import 'package:task/core/theming/font_weight_helper.dart';

class TextStyles {
  const TextStyles._();

  static TextStyle font12Regular(Color color) => TStyle(
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.regular,
        color: color,
      );

  static TextStyle font12Medium(Color color) => TStyle(
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.medium,
        color: color,
      );

  static TextStyle font14Medium(Color color) => TStyle(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.medium,
        color: color,
      );

  static TextStyle font14SemiBold(Color color) => TStyle(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.semiBold,
        color: color,
      );

  static TextStyle font16Medium(Color color) => TStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.medium,
        color: color,
      );

  static TextStyle font18SemiBold(Color color) => TStyle(
        fontSize: 18.sp,
        fontWeight: FontWeightHelper.semiBold,
        color: color,
      );
}

class TStyle extends TextStyle {
  const TStyle({
    super.fontFamily = AppFonts.montserrat,
    super.fontWeight,
    super.fontSize,
    super.color,
    super.decoration,
    super.overflow,
    super.height,
  });
}
