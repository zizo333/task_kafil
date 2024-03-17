import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/res/app_sizes.dart';
import 'package:task/core/responsive/responsive_helper.dart';
import 'package:task/core/theming/text_styles.dart';
import 'package:task/my_app.dart';
import 'package:task/ui/widgets/custom_back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    super.key,
    this.leading,
  });

  final String title;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: leading != null ? 70.h : 83.h,
        bottom: 32.h,
        left: leading != null
            ? (AppSizes.hScreenPadding - 13).w
            : AppSizes.hScreenPadding.w,
        right: leading != null
            ? (AppSizes.hScreenPadding - 13).w
            : AppSizes.hScreenPadding.w,
      ),
      child: Row(
        children: [
          if (leading != null) leading!,
          Text(
            title,
            style: TextStyles.font18SemiBold(Colors.black),
          ),
        ],
      ),
    );
    // return AppBar(
    //   backgroundColor: Colors.white,
    //   elevation: 0,
    //   shadowColor: Colors.transparent,
    //   toolbarHeight: 70.h,
    //   titleSpacing: 0.w,
    //   titleTextStyle: TextStyles.font18SemiBold(Colors.black).copyWith(),
    //   title: Row(
    //     children: [
    //       if (leading != null) leading!,
    //       Text(title),
    //     ],
    //   ),
    //   surfaceTintColor: Colors.transparent,
    //   // leading: leading ?? const CustomBackButton(),
    // );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        getValueForScreenType(
          navigatorKey.currentContext!,
          mobile: 135.h,
          tablet: (AppSizes.appBarHeight + 20).h,
        ),
      );
}
