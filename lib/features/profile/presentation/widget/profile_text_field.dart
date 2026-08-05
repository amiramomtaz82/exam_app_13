import 'package:exam_app_13/core/app_theme/app_colors.dart';
import 'package:exam_app_13/core/widget/app_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final EdgeInsetsGeometry? padding;

  const ProfileTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.inputFormatters,
    this.errorText,
    this.onChanged,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = LightColors();
    final bool hasErr = errorText != null && errorText!.isNotEmpty;

    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextFormField(
            controller: controller,
            labelText: labelText,
            hintText: hintText,
            obscureText: obscureText,
            readOnly: readOnly,
            enabled: enabled,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            onChanged: onChanged,
            hasError: hasErr,
            color: colors,
            padding: EdgeInsets.zero,
          ),
          if (hasErr)
            Padding(
              padding: const EdgeInsets.only(top: 4, left: 4),
              child: Text(
                errorText!,
                style: TextStyle(
                  color: colors.error,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
