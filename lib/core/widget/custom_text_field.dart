import 'package:exam_app/feature/auth/login&&regestier/presentaion/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final String? errorText;
  final bool obscureText;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.errorText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      label: label,
      hintText: hintText,
      controller: controller,
      errorText: errorText,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
