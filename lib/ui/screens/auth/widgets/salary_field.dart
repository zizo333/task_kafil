import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/core/extensions/context_extension.dart';
import 'package:task/core/res/app_media.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/cubit/cubit/register_cubit.dart';
import 'package:task/ui/widgets/custom_text_feild.dart';

class SalaryField extends StatelessWidget {
  const SalaryField({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();

    return CustomTextField(
      title: AppStrings.salary,
      controller: registerCubit.salaryController,
      focusNode: registerCubit.salaryNode,
      nextNode: registerCubit.passwordNode,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      prefixIcon: Container(
        padding: EdgeInsets.only(left: 35.w),
        child: IconButton(
          onPressed: () {
            final salary = _getCurrentSalary(registerCubit.salaryController);
            if (salary != null) {
              registerCubit.salaryController.text =
                  '${AppStrings.sar} ${salary - 1}';
            }
          },
          icon: const _Icon(
            icon: Icons.remove,
          ),
        ),
      ),
      suffixIcon: Container(
        padding: EdgeInsets.only(right: 35.w),
        child: IconButton(
          onPressed: () {
            final salary = _getCurrentSalary(registerCubit.salaryController);
            if (salary != null) {
              registerCubit.salaryController.text =
                  '${AppStrings.sar} ${salary + 1}';
            }
          },
          icon: const _Icon(
            icon: Icons.add,
          ),
        ),
      ),
    );
  }

  num? _getCurrentSalary(TextEditingController controller) {
    final value = controller.text;
    num? salary = 0;
    if (value.startsWith('SAR')) {
      salary = num.tryParse(value.substring(4));
    } else {
      salary = num.tryParse(value);
    }
    return salary;
  }
}

class _Icon extends StatelessWidget {
  const _Icon({
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.r,
      height: 24.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: context.colorScheme.shadow, blurRadius: 2.r),
        ],
      ),
      child: Icon(
        icon,
        size: 18.r,
        color: context.colorScheme.primary,
      ),
    );
  }
}
