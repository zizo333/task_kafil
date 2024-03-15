// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/core/extensions/context_extension.dart';
import 'package:task/core/res/app_media.dart';
import 'package:task/core/theming/app_colors.dart';
import 'package:task/core/theming/text_styles.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    required this.onChanged,
    required this.isChecked,
    this.title,
    this.customTitle,
    super.key,
  });

  final void Function(bool isChecked) onChanged;
  final bool isChecked;
  final String? title;
  final Widget? customTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!isChecked);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.h),
        child: Row(
          children: [
            Container(
              height: 16.r,
              width: 16.r,
              decoration: BoxDecoration(
                color: isChecked ? context.colorScheme.primary : Colors.white,
                border: Border.all(
                  color: isChecked
                      ? context.colorScheme.primary
                      : AppColors.gray300,
                  width: 1.2.r,
                ),
                borderRadius: BorderRadius.circular(3.r),
              ),
              child: isChecked
                  ? Center(
                      child: SvgPicture.asset(
                        AppSvgs.check,
                        height: 7.h,
                      ),
                    )
                  : null,
            ),
            if (customTitle != null)
              customTitle!
            else if (title != null) ...[
              SizedBox(
                width: 8.w,
              ),
              Text(
                title!,
                style: TextStyles.font12Medium(AppColors.gray500),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
