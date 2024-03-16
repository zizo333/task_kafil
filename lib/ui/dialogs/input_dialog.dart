import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/extensions/context_extension.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/core/res/app_sizes.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/core/theming/app_colors.dart';
import 'package:task/core/theming/text_styles.dart';
import 'package:task/ui/widgets/custom_button.dart';
import 'package:task/ui/widgets/custom_text_feild.dart';

class InputDialog extends StatefulWidget {
  const InputDialog({
    required this.title,
    super.key,
  });

  final String title;

  @override
  State<InputDialog> createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.hContentPadding.w,
          vertical: AppSizes.vContentPadding.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              title: widget.title,
              controller: _controller,
              autofocus: true,
              maxLines: 3,
              textInputAction: TextInputAction.newline,
            ),
            16.vSpace,
            CustomButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  context.pop(_controller.text);
                }
              },
              text: AppStrings.confirm,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              radius: 8.r,
            ),
          ],
        ),
      ),
    );
  }
}
