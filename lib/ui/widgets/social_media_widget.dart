import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/core/enums/enums.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/core/theming/app_colors.dart';
import 'package:task/core/theming/text_styles.dart';
import 'package:task/cubit/register/register_cubit.dart';
import 'package:task/ui/widgets/custom_check_box.dart';
import 'package:task/ui/widgets/field_title.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({
    required this.isSelected,
    required this.onChanged,
    super.key,
  });

  final bool Function(SocialMedia socialMedia) isSelected;
  final void Function(SocialMedia socialMedia) onChanged;

  @override
  Widget build(BuildContext context) {
    return FieldTitle(
      title: AppStrings.favouriteSocialMedia,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final socialMedia = SocialMedia.values[index];
          return CustomCheckBox(
            onChanged: (_) {
              onChanged(socialMedia);
            },
            isChecked: isSelected(socialMedia),
            customTitle: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 8.35.w),
                  child: SvgPicture.asset(
                    socialMedia.icon,
                    width: 20.r,
                    height: 20.r,
                  ),
                ),
                Text(
                  socialMedia.name,
                  style: TextStyles.font14Medium(AppColors.black),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, __) {
          return 7.vSpace;
        },
        itemCount: SocialMedia.values.length,
      ),
    );
  }
}
