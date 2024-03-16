import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/core/res/app_media.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/ui/widgets/custom_text_feild.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.title,
    this.controller,
    this.focusNode,
    this.nextNode,
  });

  final String? title;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextNode;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  var _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      title: widget.title ?? AppStrings.password,
      controller: widget.controller,
      focusNode: widget.focusNode,
      nextNode: widget.nextNode,
      obscureText: _isHidden,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            _isHidden = !_isHidden;
          });
        },
        icon: SvgPicture.asset(
          _isHidden ? AppSvgs.hidePassword : AppSvgs.showPassword,
          width: 18.r,
          height: 18.r,
        ),
      ),
    );
  }
}
