import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/res/app_sizes.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: AppSizes.hScreenPadding.w,
        right: AppSizes.hScreenPadding.w,
        bottom: 52.h,
      ),
      child: Column(
        children: [],
      ),
    );
  }
}
