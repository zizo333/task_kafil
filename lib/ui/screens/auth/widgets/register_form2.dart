import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/core/enums/enums.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/core/helpers/app_converter.dart';
import 'package:task/core/res/app_media.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/cubit/register/register_cubit.dart';
import 'package:task/ui/widgets/gender_widget.dart';
import 'package:task/ui/screens/auth/widgets/salary_field.dart';
import 'package:task/ui/widgets/skills_widget.dart';
import 'package:task/ui/widgets/social_media_widget.dart';
import 'package:task/ui/widgets/user_image.dart';
import 'package:task/ui/widgets/custom_text_feild.dart';

class RegisterForm2 extends StatelessWidget {
  const RegisterForm2({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();
    return Column(
      children: [
        BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            return Form(
              key: context.read<RegisterCubit>().formKey,
              autovalidateMode: state.autovalidateMode,
              child: Column(
                children: [
                  UserImage(
                    onPicked: registerCubit.changeUserImage,
                    userImage: state.userImage,
                  ),
                  16.vSpace,
                  CustomTextField(
                    title: AppStrings.about,
                    controller: registerCubit.aboutController,
                    focusNode: registerCubit.aboutNode,
                    nextNode: registerCubit.salaryNode,
                    maxLines: 3,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                  ),
                  16.vSpace,
                  const SalaryField(),
                  16.vSpace,
                  CustomTextField(
                    title: AppStrings.birthDate,
                    controller: registerCubit.birthDateController,
                    readOnly: true,
                    onTap: () {
                      _getBirthDate(context, registerCubit);
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        _getBirthDate(context, registerCubit);
                      },
                      icon: SvgPicture.asset(
                        AppSvgs.calendar,
                        width: 18.r,
                        height: 18.r,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        16.vSpace,
        BlocBuilder<RegisterCubit, RegisterState>(
          buildWhen: (previous, current) => previous.gender != current.gender,
          builder: (context, state) {
            return Genderwidget(
              gender: state.gender,
              onTap: registerCubit.selectGender,
            );
          },
        ),
        16.vSpace,
        BlocBuilder<RegisterCubit, RegisterState>(
          buildWhen: (previous, current) => previous.skills != current.skills,
          builder: (context, state) {
            return SkillsWidget(
              skills: state.skills,
              onAddSkill: context.read<RegisterCubit>().addSkill,
              onDeleteSkill: context.read<RegisterCubit>().deleteSkill,
            );
          },
        ),
        16.vSpace,
        BlocBuilder<RegisterCubit, RegisterState>(
          buildWhen: (previous, current) =>
              previous.socialMedia != current.socialMedia,
          builder: (context, state) {
            return SocialMediaWidget(
              isSelected: registerCubit.isSelected,
              onChanged: registerCubit.selectSocialMedia,
            );
          },
        ),
      ],
    );
  }

  void _getBirthDate(BuildContext context, RegisterCubit registerCubit) {
    showDatePicker(
      context: context,
      initialDate: AppConverter.textToDateTime(
        registerCubit.birthDateController.text,
      ),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date != null) {
        registerCubit.birthDateController.text =
            AppConverter.dateTimeToText(date);
      }
    });
  }
}
