import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/enums/enums.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/cubit/who_am_i/who_am_i_cubit.dart';
import 'package:task/ui/widgets/custom_radio_tile.dart';
import 'package:task/ui/widgets/custom_text_feild.dart';
import 'package:task/ui/widgets/field_title.dart';
import 'package:task/ui/widgets/password_field.dart';

class WhoAmIForm1 extends StatelessWidget {
  const WhoAmIForm1({super.key});

  @override
  Widget build(BuildContext context) {
    final whoAmICubit = context.read<WhoAmICubit>();

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                title: AppStrings.firstName,
                controller: whoAmICubit.firstNameController,
                focusNode: whoAmICubit.firstNameNode,
                nextNode: whoAmICubit.lastNameNode,
              ),
            ),
            9.hSpace,
            Expanded(
              child: CustomTextField(
                title: AppStrings.lastName,
                controller: whoAmICubit.lastNameController,
                focusNode: whoAmICubit.lastNameNode,
                nextNode: whoAmICubit.emailAddressNode,
              ),
            ),
          ],
        ),
        16.vSpace,
        CustomTextField(
          title: AppStrings.emailAddress,
          controller: whoAmICubit.emailAddressController,
          focusNode: whoAmICubit.emailAddressNode,
          nextNode: whoAmICubit.passwordNode,
          keyboardType: TextInputType.emailAddress,
        ),
        16.vSpace,
        PasswordField(
          controller: whoAmICubit.passwordController,
          focusNode: whoAmICubit.passwordNode,
          nextNode: whoAmICubit.confirmPasswordNode,
        ),
        16.vSpace,
        BlocBuilder<WhoAmICubit, WhoAmIState>(
          buildWhen: (previous, current) =>
              previous.userType != current.userType,
          builder: (context, state) {
            return FieldTitle(
              title: AppStrings.userType,
              inset: 16.h,
              child: Row(
                children: [
                  CustomRadioTile<UserType>(
                    title: AppStrings.seller,
                    value: state.userType,
                    groupValue: UserType.seller,
                    onChanged: (type) {},
                  ),
                  24.hSpace,
                  CustomRadioTile<UserType>(
                    title: AppStrings.buyer,
                    value: state.userType,
                    groupValue: UserType.buyer,
                    onChanged: (type) {},
                  ),
                  24.hSpace,
                  CustomRadioTile<UserType>(
                    title: AppStrings.both,
                    value: state.userType,
                    groupValue: UserType.both,
                    onChanged: (type) {},
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
