import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/core/extensions/context_extension.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/core/helpers/app_functions.dart';
import 'package:task/core/res/app_media.dart';
import 'package:task/core/res/app_sizes.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/core/routing/routes.dart';
import 'package:task/ui/screens/auth/widgets/login_bottom_part.dart';
import 'package:task/ui/screens/auth/widgets/login_form.dart';
import 'package:task/ui/screens/auth/widgets/register_form.dart';
import 'package:task/ui/widgets/custom_app_bar.dart';
import 'package:task/ui/widgets/custom_back_button.dart';
import 'package:task/ui/widgets/custom_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: AppFunctions.unFocusKeyboard,
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppStrings.register,
          leading: CustomBackButton(
            onTap: () {
              context.pushReplacementNamed(Routes.loginScreen);
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: AppSizes.hScreenPadding.w,
            right: AppSizes.hScreenPadding.w,
            bottom: 57.h,
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                AppSvgs.loginCuate,
                width: 225.r,
                height: 225.r,
              ),
              20.vSpace,
              const RegisterForm(),
              56.vSpace,
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: CustomButton(
                  onPressed: () {},
                  text: AppStrings.next,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
