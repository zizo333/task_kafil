import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/enums/enums.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/cubit/cubit/register_cubit.dart';
import 'package:task/ui/widgets/custom_radio_tile.dart';
import 'package:task/ui/widgets/field_title.dart';

class Genderwidget extends StatelessWidget {
  const Genderwidget({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.gender != current.gender,
      builder: (context, state) {
        return FieldTitle(
          title: AppStrings.gender,
          child: Row(
            children: [
              CustomRadioTile<Gender>(
                title: AppStrings.male,
                value: Gender.male,
                groupValue: state.gender,
                onChanged: registerCubit.selectGender,
              ),
              24.hSpace,
              CustomRadioTile<Gender>(
                title: AppStrings.female,
                value: Gender.female,
                groupValue: state.gender,
                onChanged: registerCubit.selectGender,
              ),
            ],
          ),
        );
      },
    );
  }
}
