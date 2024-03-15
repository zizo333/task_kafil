import 'package:flutter/material.dart';
import 'package:task/core/responsive/context_extension.dart';

T getValueForScreenType<T>(
  BuildContext context, {
  required T mobile,
  T? tablet,
}) {
  final deviceScreenType = context.deviceScreenType;

  if (deviceScreenType == DeviceScreenType.tablet && tablet != null) {
    return tablet;
  }
  return mobile;
}

enum DeviceScreenType { mobile, tablet }
