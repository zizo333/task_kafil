import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.onTap,
    required this.title,
    super.key,
    this.style,
  });

  final void Function() onTap;
  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.h),
        child: Text(
          title,
          style: style,
        ),
      ),
    );
  }
}
