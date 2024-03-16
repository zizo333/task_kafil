import 'package:flutter/material.dart';
import 'package:task/core/extensions/context_extension.dart';
import 'package:task/core/res/app_media.dart';
import 'package:task/core/res/app_strings.dart';

enum RequestState { none, loading, error, loaded }

enum UserType { seller, buyer, both }

enum Gender { male, female }

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

enum SocialMedia {
  facebook(icon: AppSvgs.facebook, name: AppStrings.facebook),
  twitter(icon: AppSvgs.twitter, name: AppStrings.twitter),
  linkdeIn(icon: AppSvgs.linkedin, name: AppStrings.linkedIn);

  const SocialMedia({
    required this.icon,
    required this.name,
  });

  final String icon;
  final String name;
}
