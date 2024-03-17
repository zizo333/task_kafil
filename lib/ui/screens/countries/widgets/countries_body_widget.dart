import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/res/app_sizes.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/core/theming/app_colors.dart';
import 'package:task/core/theming/text_styles.dart';

class CountriesBodyWidget extends StatelessWidget {
  const CountriesBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.hScreenPadding.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.containerShadow,
            offset: Offset(0, 4.r),
            blurRadius: 40.r,
            spreadRadius: -5.r,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 13.h),
            margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 14.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.gray50,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      AppStrings.countries,
                      style: TextStyles.font12SemiBold(AppColors.gray500),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      AppStrings.capital,
                      style: TextStyles.font12SemiBold(AppColors.gray500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
