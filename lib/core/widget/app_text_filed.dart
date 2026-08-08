
import 'package:flutter/material.dart';

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
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final AppColors? color;

  const AppTextFormField({Key? key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.color,
    this.hasError=false,
    this.onChanged,}) : super(key: key,);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16,vertical: 8),
      child: TextFormField(autovalidateMode: AutovalidateMode.onUserInteraction,

          controller: controller,
          focusNode: focusNode,
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: _buildInputDecoration()
      ),
    );
  }
  InputDecoration _buildInputDecoration() {
    final AppColors colors = color ?? LightColors();

    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      labelStyle: TextStyle(
        color: hasError ? colors.error : colors.textPrimary,
      ),
    );
  }
}
