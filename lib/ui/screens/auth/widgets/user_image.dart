import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/core/extensions/context_extension.dart';
import 'package:task/core/helpers/app_functions.dart';
import 'package:task/core/res/app_media.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    required this.onPicked,
    required this.userImage,
    super.key,
  });

  final void Function(File file) onPicked;
  final File? userImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 92.r,
      height: 92.r,
      child: Stack(
        children: [
          if (userImage != null)
            Container(
              width: 83.r,
              height: 83.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1.r,
                  color: context.colorScheme.primary,
                ),
                image: DecorationImage(
                  image: FileImage(userImage!),
                  fit: BoxFit.fill,
                ),
              ),
            )
          else
            Image.asset(
              AppImages.userImage,
              width: 83.r,
              height: 83.r,
              fit: BoxFit.fill,
            ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () {
                AppFunctions.pickFile().then((file) {
                  if (file != null) {
                    onPicked(file);
                  }
                });
              },
              icon: SvgPicture.asset(
                AppSvgs.add,
                width: 25.r,
                height: 25.r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
