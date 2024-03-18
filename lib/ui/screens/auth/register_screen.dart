import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/core/enums/enums.dart';
import 'package:task/core/extensions/context_extension.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/core/helpers/app_functions.dart';
import 'package:task/core/res/app_media.dart';
import 'package:task/core/res/app_sizes.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/core/routing/routes.dart';
import 'package:task/cubit/register/register_cubit.dart';
import 'package:task/ui/screens/auth/widgets/login_bottom_part.dart';
import 'package:task/ui/screens/auth/widgets/login_form.dart';
import 'package:task/ui/screens/auth/widgets/register_form1.dart';
import 'package:task/ui/screens/auth/widgets/register_form2.dart';
import 'package:task/ui/screens/auth/widgets/register_stepper.dart';
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
              BlocBuilder<RegisterCubit, RegisterState>(
                buildWhen: (previous, current) =>
                    previous.stepNumber != current.stepNumber,
                builder: (context, state) {
                  return Column(
                    children: [
                      RegisterStepper(
                        currentStep: state.stepNumber,
                      ),
                      32.vSpace,
                      AnimatedSwitcher(
                        duration: AppFunctions.duration300ms,
                        child: state.stepNumber == StepNumber.step1
                            ? const RegisterForm1()
                            : const RegisterForm2(),
                      ),
                    ],
                  );
                },
              ),
              56.vSpace,
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: BlocBuilder<RegisterCubit, RegisterState>(
                  buildWhen: (previous, current) =>
                      previous.stepNumber != current.stepNumber,
                  builder: (context, state) {
                    return CustomButton(
                      onPressed: () {
                        context
                            .read<RegisterCubit>()
                            .changeStepNumber(StepNumber.step2);
                      },
                      text: state.stepNumber == StepNumber.step1
                          ? AppStrings.next
                          : AppStrings.submit,
                      width: state.stepNumber == StepNumber.step1
                          ? null
                          : double.maxFinite,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
