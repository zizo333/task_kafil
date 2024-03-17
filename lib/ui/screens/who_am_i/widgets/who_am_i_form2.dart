import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/core/helpers/app_converter.dart';
import 'package:task/core/res/app_media.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/cubit/register/register_cubit.dart';
import 'package:task/cubit/who_am_i/who_am_i_cubit.dart';
import 'package:task/ui/widgets/gender_widget.dart';
import 'package:task/ui/screens/auth/widgets/salary_field.dart';
import 'package:task/ui/widgets/skills_widget.dart';
import 'package:task/ui/widgets/social_media_widget.dart';
import 'package:task/ui/widgets/custom_text_feild.dart';
import 'package:task/ui/widgets/user_image.dart';

class WhoAmIForm2 extends StatelessWidget {
  const WhoAmIForm2({super.key});

  @override
  Widget build(BuildContext context) {
    final whoAmICubit = context.read<WhoAmICubit>();
    return Column(
      children: [
        CustomTextField(
          title: AppStrings.about,
          controller: whoAmICubit.aboutController,
          focusNode: whoAmICubit.aboutNode,
          nextNode: whoAmICubit.salaryNode,
          maxLines: 3,
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
        ),
        16.vSpace,
        CustomTextField(
          title: AppStrings.salary,
          controller: whoAmICubit.salaryController,
          focusNode: whoAmICubit.salaryNode,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.number,
        ),
        16.vSpace,
        CustomTextField(
          title: AppStrings.birthDate,
          controller: whoAmICubit.birthDateController,
          readOnly: true,
          onTap: () {
            _getBirthDate(context, whoAmICubit);
          },
          suffixIcon: IconButton(
            onPressed: () {
              _getBirthDate(context, whoAmICubit);
            },
            icon: SvgPicture.asset(
              AppSvgs.calendar,
              width: 18.r,
              height: 18.r,
            ),
          ),
        ),
        16.vSpace,
        BlocBuilder<WhoAmICubit, WhoAmIState>(
          buildWhen: (previous, current) => previous.gender != current.gender,
          builder: (context, state) {
            return Genderwidget(
              gender: state.gender,
              onTap: whoAmICubit.selectGender,
            );
          },
        ),
        16.vSpace,
        BlocBuilder<WhoAmICubit, WhoAmIState>(
          buildWhen: (previous, current) => previous.skills != current.skills,
          builder: (context, state) {
            return SkillsWidget(
              skills: state.skills,
              onAddSkill: whoAmICubit.addSkill,
              onDeleteSkill: whoAmICubit.deleteSkill,
            );
          },
        ),
        16.vSpace,
        BlocBuilder<WhoAmICubit, WhoAmIState>(
          buildWhen: (previous, current) =>
              previous.socialMedia != current.socialMedia,
          builder: (context, state) {
            return SocialMediaWidget(
              isSelected: whoAmICubit.isSelected,
              onChanged: whoAmICubit.selectSocialMedia,
            );
          },
        ),
      ],
    );
  }

  void _getBirthDate(BuildContext context, WhoAmICubit whoAmICubit) {
    showDatePicker(
      context: context,
      initialDate: AppConverter.textToDateTime(
        whoAmICubit.birthDateController.text,
      ),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date != null) {
        whoAmICubit.birthDateController.text =
            AppConverter.dateTimeToText(date);
      }
    });
  }
}
