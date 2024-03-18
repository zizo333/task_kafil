import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/extensions/context_extension.dart';
import 'package:task/core/helpers/app_functions.dart';
import 'package:task/core/responsive/responsive_helper.dart';
import 'package:task/core/theming/app_colors.dart';
import 'package:task/core/theming/text_styles.dart';

class CustomRadioTile<T> extends StatelessWidget {
  const CustomRadioTile({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    super.key,
  });

  final String title;
  final T? value;
  final T? groupValue;
  final void Function(T value) onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (value != null) {
          onChanged(value as T);
        }
      },
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [
            AnimatedContainer(
              duration: AppFunctions.duration300ms,
              height:
                  getValueForScreenType(context, mobile: 18.33.r, tablet: 34.r),
              width:
                  getValueForScreenType(context, mobile: 18.33.r, tablet: 34.r),
              padding: EdgeInsets.all(
                getValueForScreenType(context, mobile: 2.r, tablet: 8.r),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: value == groupValue
                      ? context.colorScheme.primary
                      : AppColors.gray300,
                  width: 2.r,
                ),
              ),
              child: value == groupValue
                  ? Center(
                      child: AnimatedContainer(
                        duration: AppFunctions.duration300ms,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.colorScheme.primary,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            SizedBox(
              width: 12.w,
            ),
            Text(
              title,
              style: TextStyles.font14Medium(AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
