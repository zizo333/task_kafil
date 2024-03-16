import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/extensions/context_extension.dart';
import 'package:task/core/helpers/app_functions.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/cubit/cubit/register_cubit.dart';
import 'package:task/ui/widgets/custom_text_feild.dart';

class SalaryField extends StatefulWidget {
  const SalaryField({super.key});

  @override
  State<SalaryField> createState() => _SalaryFieldState();
}

class _SalaryFieldState extends State<SalaryField> {
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
    var salary = _registerCubit.salaryController.text;
    if (_registerCubit.salaryNode.hasFocus) {
      salary = salary.substring(4);
      _registerCubit.salaryController.text = salary;
      _registerCubit.salaryController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: salary.length,
      );
    } else {
      _registerCubit.salaryController.text =
          '${salary.startsWith(AppStrings.sar) ? '' : '${AppStrings.sar} '}${salary.isEmpty || (num.tryParse(salary) ?? 0) < 0 ? 0 : salary}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      title: AppStrings.salary,
      controller: _registerCubit.salaryController,
      focusNode: _registerCubit.salaryNode,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      prefixIcon: Padding(
        padding: EdgeInsets.only(left: 35.w),
        child: IconButton(
          onPressed: () {
            final salary = _getCurrentSalary();
            if (salary != null && salary > 0) {
              _registerCubit.salaryController.text =
                  '${AppStrings.sar} ${salary - 1}';
            }
          },
          icon: const _Icon(
            icon: Icons.remove,
          ),
        ),
      ),
      suffixIcon: Padding(
        padding: EdgeInsets.only(right: 35.w),
        child: IconButton(
          onPressed: () {
            final salary = _getCurrentSalary();
            if (salary != null) {
              _registerCubit.salaryController.text =
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

  num? _getCurrentSalary() {
    if (_registerCubit.salaryNode.hasFocus) {
      AppFunctions.unFocusKeyboard();
      return num.tryParse(_registerCubit.salaryController.text);
    } else {
      return num.tryParse(_registerCubit.salaryController.text.substring(4));
    }
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
