import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/core/theming/app_colors.dart';
import 'package:task/core/theming/text_styles.dart';
import 'package:task/cubit/login/login_cubit.dart';
import 'package:task/ui/widgets/custom_check_box.dart';
import 'package:task/ui/widgets/custom_text_button.dart';
import 'package:task/ui/widgets/custom_text_feild.dart';
import 'package:task/ui/widgets/password_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.autovalidateMode != current.autovalidateMode ||
          previous.isRememberMeSelected != current.isRememberMeSelected,
      builder: (context, state) {
        return Form(
          key: context.read<LoginCubit>().formKey,
          autovalidateMode: state.autovalidateMode,
          child: Column(
            children: [
              CustomTextField(
                title: AppStrings.emailAddress,
                controller: loginCubit.emailAddressController,
                focusNode: loginCubit.emailAddressNode,
                nextNode: loginCubit.passwordNode,
                keyboardType: TextInputType.emailAddress,
              ),
              16.vSpace,
              PasswordField(
                controller: loginCubit.passwordController,
                focusNode: loginCubit.passwordNode,
              ),
              7.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCheckBox(
                    onChanged: (isChecked) {},
                    isChecked: state.isRememberMeSelected,
                    title: AppStrings.rememberMe,
                  ),
                  CustomTextButton(
                    onTap: () {},
                    title: AppStrings.forgotPassword,
                    style: TextStyles.font12Medium(AppColors.gray500),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
