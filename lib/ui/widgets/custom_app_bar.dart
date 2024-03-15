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
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      shadowColor: Colors.transparent,
      toolbarHeight: 100.h,
      titleSpacing: 0.w,
      titleTextStyle: TextStyles.font18SemiBold(Colors.black).copyWith(),
      title: Row(
        children: [
          if (leading != null) leading!,
          Text(title),
        ],
      ),
      surfaceTintColor: Colors.transparent,
      // leading: leading ?? const CustomBackButton(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        getValueForScreenType(
          navigatorKey.currentContext!,
          mobile: 100.h,
          tablet: (AppSizes.appBarHeight + 20).h,
        ),
      );
}
