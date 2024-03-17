import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:task/core/extensions/context_extension.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/core/res/app_media.dart';
import 'package:task/core/res/app_sizes.dart';
import 'package:task/core/theming/app_colors.dart';
import 'package:task/core/theming/text_styles.dart';

class PaginatorWidget extends StatefulWidget {
  const PaginatorWidget({super.key});

  @override
  State<PaginatorWidget> createState() => _PaginatorWidgetState();
}

class _PaginatorWidgetState extends State<PaginatorWidget> {
  var _currentPage = 0;
  final _controller = NumberPaginatorController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.hScreenPadding.w),
      child: Column(
        children: [
          NumberPaginator(
            controller: _controller,
            numberPages: 10,
            onPageChange: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            initialPage: _currentPage,
            prevButtonContent: Icon(
              Icons.chevron_left,
              color: AppColors.gray300,
              size: 22.r,
            ),
            nextButtonContent: Icon(
              Icons.chevron_right,
              color: AppColors.gray300,
              size: 22.r,
            ),
            config: NumberPaginatorUIConfig(
              height: 44.r,
              buttonPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              buttonShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
                side: BorderSide(
                  color: AppColors.gray200,
                  width: 1.5.w,
                ),
              ),
              buttonTextStyle: TextStyles.font14Medium(AppColors.gray800),
              buttonSelectedForegroundColor: Colors.white,
              buttonUnselectedForegroundColor: AppColors.gray800,
              buttonUnselectedBackgroundColor: Colors.white,
              buttonSelectedBackgroundColor: context.colorScheme.primary,
            ),
          ),
          5.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  _controller.navigateToPage(0);
                },
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  width: 35.r,
                  height: 35.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: AppColors.gray200,
                      width: 1.5.w,
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppSvgs.first,
                      width: 16.r,
                      height: 16.r,
                    ),
                  ),
                ),
              ),
              12.hSpace,
              InkWell(
                onTap: () {
                  _controller.navigateToPage(9);
                },
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  width: 35.r,
                  height: 35.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: AppColors.gray200,
                      width: 1.5.w,
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppSvgs.last,
                      width: 16.r,
                      height: 16.r,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
