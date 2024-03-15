import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/res/app_fonts.dart';
import 'package:task/core/res/app_sizes.dart';
import 'package:task/core/theming/app_colors.dart';

ThemeData appTheme = ThemeData(
  fontFamily: AppFonts.montserrat,
  useMaterial3: true,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: AppColors.background,
  hintColor: AppColors.hint,
  colorScheme: ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    shadow: AppColors.shadow,
    error: AppColors.error,
  ),
  cardTheme: CardTheme(
    elevation: AppSizes.elevation.r,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.radius.r),
    ),
  ),
  dividerTheme: DividerThemeData(
    thickness: AppSizes.dividerThickness.r,
    color: AppColors.divider,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    shape: const CircleBorder(),
  ),
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
  dialogTheme: const DialogTheme(surfaceTintColor: Colors.white),
);
