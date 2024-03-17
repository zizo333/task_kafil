import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/core/extensions/context_extension.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/core/helpers/app_functions.dart';
import 'package:task/core/res/app_media.dart';
import 'package:task/core/res/app_sizes.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/core/theming/app_colors.dart';
import 'package:task/core/theming/text_styles.dart';
import 'package:task/ui/dialogs/input_dialog.dart';
import 'package:task/ui/widgets/field_title.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({
    required this.skills,
    required this.onAddSkill,
    required this.onDeleteSkill,
    super.key,
  });

  final List<String> skills;
  final void Function(String skill) onAddSkill;
  final void Function(String skill) onDeleteSkill;

  @override
  Widget build(BuildContext context) {
    return FieldTitle(
      title: AppStrings.skills,
      child: GestureDetector(
        onTap: () {
          AppFunctions.showAppDialog<String>(
            context,
            child: const InputDialog(
              title: AppStrings.enterYourSkill,
            ),
          ).then((skill) {
            if (skill != null) {
              onAddSkill(skill);
            }
          });
        },
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 22.w,
            right: 19.w,
            top: skills.isEmpty ? 23.h : 20.h,
            bottom: skills.isEmpty ? 23.h : 20.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.gray50,
            borderRadius: BorderRadius.circular(
              AppSizes.radius.r,
            ),
          ),
          child: skills.isEmpty
              ? const Text('')
              : Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: skills
                      .map(
                        (skill) => Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary100,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                skill,
                                style: TextStyles.font12Medium(
                                  context.colorScheme.primary,
                                ),
                              ),
                              3.hSpace,
                              InkWell(
                                onTap: () {
                                  onDeleteSkill(skill);
                                },
                                child: SvgPicture.asset(
                                  AppSvgs.close,
                                  width: 12.r,
                                  height: 12.r,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
        ),
      ),
    );
  }
}
