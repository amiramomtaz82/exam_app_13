import 'package:exam_app_13/core/app_theme/app_colors.dart';
import 'package:exam_app_13/core/widget/app_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  const ProfileTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.inputFormatters,
    this.errorText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = LightColors();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextFormField(
          controller: controller,
          labelText: labelText,
          hintText: hintText,
          obscureText: obscureText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          hasError: errorText != null,
          color: colors,
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              errorText!,
              style: TextStyle(color: colors.error, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
