import 'package:flutter/material.dart';
import 'package:task/core/extensions/context_extension.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/core/routing/routes.dart';
import 'package:task/core/theming/app_colors.dart';
import 'package:task/core/theming/text_styles.dart';
import 'package:task/ui/widgets/custom_text_button.dart';

class LoginBottomPart extends StatelessWidget {
  const LoginBottomPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${AppStrings.donnotHaveAnAccount} ',
          style: TextStyles.font14Medium(AppColors.gray500),
        ),
        CustomTextButton(
          onTap: () {
            context.pushReplacementNamed(Routes.registerScreen);
          },
          title: AppStrings.register,
          style: TextStyles.font14SemiBold(AppColors.primary),
        ),
      ],
    );
  }
}
