
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_theme/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool hasError;
  final bool readOnly;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final AppColors? color;
  final EdgeInsetsGeometry? padding;

  const AppTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.hasError = false,
    this.readOnly = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.color,
    this.onChanged,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 8),
      child: _buildTextField(),
    );
  }

  Widget _buildTextField() {
    final AppColors colors = color ?? LightColors();
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      enabled: enabled,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      style: TextStyle(
        color: colors.textPrimary,
        fontSize: 14,
      ),
      decoration: _buildInputDecoration(),
    );
  }

  InputDecoration _buildInputDecoration() {
    final AppColors colors = color ?? LightColors();

    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      labelStyle: TextStyle(
        color: hasError ? colors.error : colors.darkGrey,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: hasError ? colors.error : colors.darkGrey,
          width: 1.2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: hasError ? colors.error : colors.primary,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: colors.error,
          width: 1.2,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: colors.error,
          width: 1.5,
        ),
      ),
    );
  }
}

