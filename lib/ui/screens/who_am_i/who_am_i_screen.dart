import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/core/res/app_sizes.dart';
import 'package:task/cubit/who_am_i/who_am_i_cubit.dart';
import 'package:task/ui/screens/who_am_i/widgets/who_am_i_form1.dart';
import 'package:task/ui/screens/who_am_i/widgets/who_am_i_form2.dart';
import 'package:task/ui/widgets/user_image.dart';

class WhoAmIScreen extends StatelessWidget {
  const WhoAmIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final whoAmICubit = context.read<WhoAmICubit>();
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: AppSizes.hScreenPadding.w,
        right: AppSizes.hScreenPadding.w,
        bottom: 52.h,
      ),
      child: Column(
        children: [
          BlocBuilder<WhoAmICubit, WhoAmIState>(
            buildWhen: (previous, current) =>
                previous.userImage != current.userImage,
            builder: (context, state) {
              return UserImage(
                onPicked: whoAmICubit.changeUserImage,
                userImage: state.userImage,
              );
            },
          ),
          32.vSpace,
          Form(
            key: context.read<WhoAmICubit>().formKey,
            child: Column(
              children: [
                const WhoAmIForm1(),
                16.vSpace,
                const WhoAmIForm2(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
