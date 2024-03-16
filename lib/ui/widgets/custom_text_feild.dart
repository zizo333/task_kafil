import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/extensions/context_extension.dart';
import 'package:task/core/helpers/app_functions.dart';
import 'package:task/core/res/app_sizes.dart';
import 'package:task/core/theming/app_colors.dart';
import 'package:task/core/theming/text_styles.dart';
import 'package:task/ui/widgets/field_title.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.nextNode,
    this.title,
    this.subtitle,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.enabled,
    this.readOnly = false,
    this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.maxLength = 0,
    this.onTap,
    this.border,
    this.autofocus = false,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final String? title;
  final String? subtitle;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? enabled;
  final bool readOnly;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final void Function()? onTap;
  final TextAlign textAlign;
  final int maxLength;
  final InputBorder? border;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return FieldTitle(
      title: title,
      child: TextFormField(
        cursorColor: Colors.black,
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        enabled: enabled,
        readOnly: readOnly,
        maxLines: maxLines,
        autofocus: autofocus,
        obscureText: obscureText ?? false,
        obscuringCharacter: '●',
        inputFormatters: [
          if (maxLength > 0) LengthLimitingTextInputFormatter(maxLength),
        ],
        style: TextStyles.font16Medium(AppColors.gray800),
        textAlign: textAlign,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.only(
            left: 22.w,
            right: 19.w,
            top: 20.h,
            bottom: 20.h,
          ),
          alignLabelWithHint: true,
          errorStyle: TextStyles.font12Medium(context.colorScheme.error),
          filled: true,
          fillColor: AppColors.gray50,
          border: border ?? _decoratedBorder(),
          enabledBorder: border ?? _decoratedBorder(),
          disabledBorder: border ?? _decoratedBorder(),
          focusedBorder:
              border ?? _decoratedBorder(context.colorScheme.primary),
          errorBorder: border ?? _decoratedBorder(context.colorScheme.error),
          focusedErrorBorder:
              border ?? _decoratedBorder(context.colorScheme.error),
          prefixIcon: prefixIcon == null
              ? null
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    prefixIcon!,
                  ],
                ),
          suffixIconConstraints: BoxConstraints(minWidth: 50.w),
          suffixIcon: suffixIcon == null
              ? null
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    suffixIcon!,
                  ],
                ),
        ),
        onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(nextNode),
        onChanged: onChanged,
        validator: validator,
        onTap: onTap,
      ),
    );
  }

  OutlineInputBorder _decoratedBorder([Color? borderColor]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.radius.r),
      borderSide: BorderSide.none,
    );
  }
}
