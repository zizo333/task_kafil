import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/core/enums/enums.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/core/helpers/app_converter.dart';
import 'package:task/core/res/app_media.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/core/theming/app_colors.dart';
import 'package:task/core/theming/text_styles.dart';
import 'package:task/cubit/cubit/register_cubit.dart';
import 'package:task/ui/screens/auth/widgets/gender_widget.dart';
import 'package:task/ui/screens/auth/widgets/salary_field.dart';
import 'package:task/ui/screens/auth/widgets/skills_widget.dart';
import 'package:task/ui/screens/auth/widgets/social_media_widget.dart';
import 'package:task/ui/screens/auth/widgets/user_image.dart';
import 'package:task/ui/widgets/custom_check_box.dart';
import 'package:task/ui/widgets/custom_radio_tile.dart';
import 'package:task/ui/widgets/custom_text_feild.dart';
import 'package:task/ui/widgets/field_title.dart';
import 'package:task/ui/widgets/password_field.dart';

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
        const Genderwidget(),
        16.vSpace,
        const SkillsWidget(),
        16.vSpace,
        const SocialMediaWidget(),
        16.vSpace,
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
