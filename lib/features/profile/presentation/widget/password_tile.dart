import 'package:exam_app_13/core/app_theme/app_colors.dart';
import 'package:exam_app_13/features/profile/presentation/widget/profile_text_field.dart';
import 'package:flutter/material.dart';

class PasswordTile extends StatefulWidget {
  final String label;
  final String? hintText;
  final String? errorText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const PasswordTile({
    super.key,
    required this.label,
    this.hintText,
    this.errorText,
    this.keyboardType,
    this.onChanged,
    this.controller,
  });

  @override
  State<PasswordTile> createState() => _PasswordTileState();
}

class _PasswordTileState extends State<PasswordTile> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = LightColors();
    return ProfileTextField(
      controller: widget.controller,
      labelText: widget.label,
      hintText: widget.hintText,
      obscureText: _obscure,
      keyboardType: widget.keyboardType,
      errorText: widget.errorText,
      onChanged: widget.onChanged,
      suffixIcon: IconButton(
        onPressed: () => setState(() => _obscure = !_obscure),
        icon: Icon(
          _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: colors.darkGrey,
          size: 20,
        ),
      ),
    );
  }
}
