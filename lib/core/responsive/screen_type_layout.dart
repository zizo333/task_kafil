import 'package:flutter/material.dart';
import 'package:task/core/responsive/context_extension.dart';
import 'package:task/core/responsive/responsive_helper.dart';

class ScreenTypeLayout extends StatelessWidget {
  const ScreenTypeLayout({
    required this.mobile,
    this.tablet,
    super.key,
  });

  final Widget mobile;
  final Widget? tablet;

  @override
  Widget build(BuildContext context) {
    final deviceScreenType = context.deviceScreenType;

    if (deviceScreenType == DeviceScreenType.tablet && tablet != null) {
      return tablet!;
    }
    return mobile;
  }
}
