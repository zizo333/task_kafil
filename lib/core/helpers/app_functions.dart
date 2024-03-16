import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/enums/enums.dart';
import 'package:task/core/res/app_sizes.dart';
import 'package:task/core/theming/text_styles.dart';
import 'package:toast/toast.dart';

class AppFunctions {
  const AppFunctions._();

  static Future<void> setPreferredOrientations() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  static void unFocusKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void showToastMessage(
    BuildContext context,
    String message, {
    int duration = 2,
    ToastType type = ToastType.error,
  }) {
    ToastContext().init(context);
    Toast.show(
      message,
      textStyle: TextStyles.font12Medium(Colors.white),
      duration: duration,
      backgroundColor: type.getColor(context).withOpacity(0.9),
      backgroundRadius: AppSizes.radius.r,
    );
  }

  static Future<T?> showAppDialog<T>(
    BuildContext context, {
    required Widget child,
    Color? bgColor,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierColor: bgColor ?? Colors.black54,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return child;
      },
    );
  }

  static Future<void> showBottomSheet({
    required BuildContext context,
    required Widget child,
  }) async {
    return showModalBottomSheet<void>(
      context: context,
      constraints: const BoxConstraints(minWidth: double.infinity),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: AppSizes.elevation.r,
      builder: (context) => child,
    );
  }

  static Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      return File(result.files.single.path!);
    }
    return null;
  }

  static Duration get duration300ms => const Duration(milliseconds: 300);
  static Duration get duration2m => const Duration(minutes: 2);
}

void showLog(Object? object) {
  if (kDebugMode) {
    print('** $object');
  }
}
