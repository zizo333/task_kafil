import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/di/di_imports.dart';
import 'package:task/core/enums/enums.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/cubit/register/register_cubit.dart';
import 'package:task/data/models/user_type_model.dart';
import 'package:task/ui/widgets/custom_radio_tile.dart';
import 'package:task/ui/widgets/custom_text_feild.dart';
import 'package:task/ui/widgets/field_title.dart';
import 'package:task/ui/widgets/password_field.dart';

class RegisterForm1 extends StatelessWidget {
  const RegisterForm1({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();

    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) =>
          previous.autovalidateMode != current.autovalidateMode ||
          previous.userType != current.userType,
      builder: (context, state) {
        return Form(
          key: context.read<RegisterCubit>().formKey,
          autovalidateMode: state.autovalidateMode,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      title: AppStrings.firstName,
                      controller: registerCubit.firstNameController,
                      focusNode: registerCubit.firstNameNode,
                      nextNode: registerCubit.lastNameNode,
                    ),
                  ),
                  9.hSpace,
                  Expanded(
                    child: CustomTextField(
                      title: AppStrings.lastName,
                      controller: registerCubit.lastNameController,
                      focusNode: registerCubit.lastNameNode,
                      nextNode: registerCubit.emailAddressNode,
                    ),
                  ),
                ],
              ),
              16.vSpace,
              CustomTextField(
                title: AppStrings.emailAddress,
                controller: registerCubit.emailAddressController,
                focusNode: registerCubit.emailAddressNode,
                nextNode: registerCubit.passwordNode,
                keyboardType: TextInputType.emailAddress,
              ),
              16.vSpace,
              PasswordField(
                controller: registerCubit.passwordController,
                focusNode: registerCubit.passwordNode,
                nextNode: registerCubit.confirmPasswordNode,
              ),
              16.vSpace,
              PasswordField(
                title: AppStrings.confirmPassword,
                controller: registerCubit.confirmPasswordController,
                focusNode: registerCubit.confirmPasswordNode,
              ),
              16.vSpace,
              FieldTitle(
                title: AppStrings.userType,
                inset: 16.h,
                child: Row(
                  children: sl<UserTypes>()
                      .userTpes
                      .map(
                        (userType) => CustomRadioTile<UserTypeModel>(
                          title: userType.label,
                          value: userType,
                          groupValue: state.userType,
                          onChanged: (type) {},
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
