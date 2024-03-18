import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/core/enums/enums.dart';
import 'package:task/core/extensions/context_extension.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/core/helpers/app_functions.dart';
import 'package:task/core/res/app_media.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/core/theming/app_colors.dart';
import 'package:task/core/theming/text_styles.dart';

class RegisterStepper extends StatelessWidget {
  const RegisterStepper({
    required this.currentStep,
    super.key,
  });

  final StepNumber currentStep;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  AppStrings.register,
                  style: TextStyles.font12SemiBold(context.colorScheme.primary),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  AppStrings.completeData,
                  style: TextStyles.font12Medium(
                    currentStep.number > 1
                        ? context.colorScheme.primary
                        : AppColors.gray300,
                  ),
                ),
              ),
            ),
          ],
        ),
        12.vSpace,
        Row(
          children: [
            Expanded(child: _StepperLine(context.colorScheme.primary)),
            if (currentStep == StepNumber.step1)
              _CurrentStep(index: currentStep.number)
            else
              const _CompletedStep(),
            Expanded(
              flex: 2,
              child: _StepperLine(
                currentStep == StepNumber.step1
                    ? AppColors.gray200
                    : context.colorScheme.primary,
              ),
            ),
            if (currentStep == StepNumber.step1)
              const _NextStep()
            else
              _CurrentStep(index: currentStep.number),
            Expanded(child: _StepperLine(AppColors.gray200)),
          ],
        ),
      ],
    );
  }

  StepNumber _getStepNumber(int index) {
    if (index == 0) {
      return StepNumber.step1;
    } else {
      return StepNumber.step2;
    }
  }
}

class _CurrentStep extends StatelessWidget {
  const _CurrentStep({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppFunctions.duration300ms,
      height: 25.r,
      width: 25.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          width: 2.r,
          color: context.colorScheme.primary,
        ),
      ),
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyles.font12SemiBold(context.colorScheme.primary),
        ),
      ),
    );
  }
}

class _CompletedStep extends StatelessWidget {
  const _CompletedStep();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppFunctions.duration300ms,
      height: 25.r,
      width: 25.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colorScheme.primary,
        border: Border.all(
          width: 2.r,
          color: context.colorScheme.primary,
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          AppSvgs.check,
          width: 10.w,
          height: 8.5.h,
        ),
      ),
    );
  }
}

class _NextStep extends StatelessWidget {
  const _NextStep();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppFunctions.duration300ms,
      height: 25.r,
      width: 25.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.gray200,
        border: Border.all(
          width: 2.r,
          color: AppColors.gray200,
        ),
      ),
    );
  }
}

class _StepperLine extends StatelessWidget {
  const _StepperLine(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppFunctions.duration300ms,
      height: 2.r,
      color: color,
    );
  }
}
