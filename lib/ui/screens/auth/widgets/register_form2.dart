import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/enums/enums.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/cubit/cubit/register_cubit.dart';
import 'package:task/ui/screens/auth/widgets/salary_field.dart';
import 'package:task/ui/screens/auth/widgets/user_image.dart';
import 'package:task/ui/widgets/custom_radio_tile.dart';
import 'package:task/ui/widgets/custom_text_feild.dart';
import 'package:task/ui/widgets/field_title.dart';
import 'package:task/ui/widgets/password_field.dart';

class RegisterForm2 extends StatefulWidget {
  const RegisterForm2({super.key});

  @override
  State<RegisterForm2> createState() => _RegisterForm2State();
}

class _RegisterForm2State extends State<RegisterForm2> {
  late final RegisterCubit _registerCubit;

  @override
  void initState() {
    super.initState();
    _registerCubit = context.read<RegisterCubit>();

    _registerCubit.salaryNode.addListener(_salaryListener);
  }

  @override
  void dispose() {
    _registerCubit.salaryNode.removeListener(_salaryListener);
    super.dispose();
  }

  void _salaryListener() {
    if (_registerCubit.salaryNode.hasFocus) {
      _registerCubit.salaryController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: _registerCubit.salaryController.text.length,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Form(
          key: context.read<RegisterCubit>().formKey,
          autovalidateMode: state.autovalidateMode,
          child: Column(
            children: [
              UserImage(
                onPicked: _registerCubit.changeUserImage,
                userImage: state.userImage,
              ),
              16.vSpace,
              CustomTextField(
                title: AppStrings.about,
                controller: _registerCubit.aboutController,
                focusNode: _registerCubit.aboutNode,
                nextNode: _registerCubit.salaryNode,
                maxLines: 3,
              ),
              16.vSpace,
              const SalaryField(),
              16.vSpace,
              PasswordField(
                controller: _registerCubit.passwordController,
                focusNode: _registerCubit.passwordNode,
                nextNode: _registerCubit.confirmPasswordNode,
              ),
              16.vSpace,
              PasswordField(
                title: AppStrings.confirmPassword,
                controller: _registerCubit.confirmPasswordController,
                focusNode: _registerCubit.confirmPasswordNode,
              ),
              16.vSpace,
              FieldTitle(
                title: AppStrings.userType,
                child: Row(
                  children: [
                    CustomRadioTile<UserType>(
                      title: AppStrings.seller,
                      value: state.userType,
                      groupValue: UserType.seller,
                      onChanged: (type) {},
                    ),
                    24.hSpace,
                    CustomRadioTile<UserType>(
                      title: AppStrings.buyer,
                      value: state.userType,
                      groupValue: UserType.buyer,
                      onChanged: (type) {},
                    ),
                    24.hSpace,
                    CustomRadioTile<UserType>(
                      title: AppStrings.both,
                      value: state.userType,
                      groupValue: UserType.both,
                      onChanged: (type) {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
