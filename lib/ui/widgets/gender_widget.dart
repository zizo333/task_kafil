import 'package:flutter/material.dart';
import 'package:task/core/enums/enums.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/ui/widgets/custom_radio_tile.dart';
import 'package:task/ui/widgets/field_title.dart';

class Genderwidget extends StatelessWidget {
  const Genderwidget({
    required this.gender,
    required this.onTap,
    super.key,
  });

  final Gender gender;
  final void Function(Gender gender) onTap;

  @override
  Widget build(BuildContext context) {
    return FieldTitle(
      title: AppStrings.gender,
      child: Row(
        children: [
          CustomRadioTile<Gender>(
            title: AppStrings.male,
            value: Gender.male,
            groupValue: gender,
            onChanged: onTap,
          ),
          24.hSpace,
          CustomRadioTile<Gender>(
            title: AppStrings.female,
            value: Gender.female,
            groupValue: gender,
            onChanged: onTap,
          ),
        ],
      ),
    );
  }
}
