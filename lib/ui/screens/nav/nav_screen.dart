import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/core/extensions/context_extension.dart';
import 'package:task/core/theming/app_colors.dart';
import 'package:task/core/theming/text_styles.dart';
import 'package:task/cubit/nav/nav_cubit.dart';
import 'package:task/cubit/nav/nav_item.dart';
import 'package:task/ui/widgets/custom_app_bar.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int>(
      builder: (context, index) {
        return WillPopScope(
          onWillPop: () async {
            if (index > 0) {
              context.read<NavCubit>().changeNavItem(0);
            } else {
              context.pop();
            }
            return false;
          },
          child: Scaffold(
            appBar: CustomAppBar(title: NavItem.items[index].label),
            body: IndexedStack(
              index: index,
              children: NavItem.items.map((item) => item.screen).toList(),
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.symmetric(vertical: 8.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
                boxShadow: [
                  BoxShadow(
                    color: context.colorScheme.shadow,
                    blurRadius: 16.r,
                    offset: Offset(0, -2.r),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: NavItem.items
                    .map(
                      (item) => IconButton(
                        onPressed: () {
                          context.read<NavCubit>().changeNavItem(item.index);
                        },
                        style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                        ),
                        icon: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              index == item.index
                                  ? item.activeIcon
                                  : item.unactiveIcon,
                              height: 26.r,
                              width: 26.r,
                            ),
                            Text(
                              item.label,
                              style: index == item.index
                                  ? TextStyles.font12Medium(
                                      context.colorScheme.primary,
                                    )
                                  : TextStyles.font12Regular(AppColors.gray300),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
