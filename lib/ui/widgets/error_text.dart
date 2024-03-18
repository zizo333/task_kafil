import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/core/res/app_media.dart';
import 'package:task/core/theming/app_colors.dart';
import 'package:task/core/theming/text_styles.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({required this.message, super.key, this.onPressed});

  final String message;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppSvgs.info,
          width: 22.r,
          height: 22.r,
          color: AppColors.error300,
        ),
        8.hSpace,
        Expanded(
          child: Text(
            message,
            style: TextStyles.font12Medium(AppColors.error300),
          ),
        ),
        if (onPressed != null) ...[
          8.hSpace,
          IconButton(
            onPressed: onPressed,
            icon: Text(
              'Retry',
              style: TextStyles.font12SemiBold(AppColors.error300),
            ),
          ),
        ],
      ],
    );
  }
}
