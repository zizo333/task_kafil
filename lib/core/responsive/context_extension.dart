import 'package:flutter/material.dart';
import 'package:task/core/responsive/responsive_helper.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Orientation get orientation => mediaQuery.orientation;
  Size get size => mediaQuery.size;
  double get width => size.width;
  double get height => size.height;

  DeviceScreenType get deviceScreenType {
    var screenWidth = 0.0;

    if (orientation == Orientation.portrait) {
      screenWidth = width;
    } else {
      screenWidth = height;
    }

    if (screenWidth > 767) {
      return DeviceScreenType.tablet;
    }

    return DeviceScreenType.mobile;
  }
}
