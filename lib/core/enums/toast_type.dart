import 'package:flutter/material.dart';
import 'package:task/core/extensions/context_extension.dart';

enum ToastType { success, error }

extension ToastTypeExtension on ToastType {
  Color getColor(BuildContext context) {
    switch (this) {
      case ToastType.success:
        return context.colorScheme.primary;
      case ToastType.error:
        return context.colorScheme.error;
    }
  }
}
