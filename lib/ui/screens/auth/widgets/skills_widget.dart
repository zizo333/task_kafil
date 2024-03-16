import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:task/cubit/cubit/register_cubit.dart';
import 'package:task/ui/dialogs/input_dialog.dart';
import 'package:task/ui/widgets/field_title.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FieldTitle(
      title: AppStrings.skills,
      child: BlocBuilder<RegisterCubit, RegisterState>(
        buildWhen: (previous, current) => previous.skills != current.skills,
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              AppFunctions.showAppDialog<String>(
                context,
                child: const InputDialog(
                  title: AppStrings.enterYourSkill,
                ),
              ).then((skill) {
                if (skill != null) {
                  context.read<RegisterCubit>().addSkill(skill);
                }
              });
            },
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 22.w,
                right: 19.w,
                top: state.skills.isEmpty ? 23.h : 20.h,
                bottom: state.skills.isEmpty ? 23.h : 20.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.gray50,
                borderRadius: BorderRadius.circular(
                  AppSizes.radius.r,
                ),
              ),
              child: state.skills.isEmpty
                  ? const Text('')
                  : Wrap(
                      spacing: 8.w,
                      runSpacing: 8.h,
                      children: state.skills
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
                                      context
                                          .read<RegisterCubit>()
                                          .deleteSkill(skill);
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
          );
        },
      ),
    );
  }
}
