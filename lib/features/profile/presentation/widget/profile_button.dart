import 'package:exam_app_13/core/app_theme/app_colors.dart';
import 'package:exam_app_13/core/widget/app_circular_indicator.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Widget? icon;

  const ProfileButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = LightColors();
    return ElevatedButton(
      onPressed: (isLoading || onPressed == null) ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.primary,
        disabledBackgroundColor: colors.blueSelected,
        foregroundColor: colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: isLoading
          ? const AppCircularIndicator()
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  icon!,
                  const SizedBox(width: 8),
                ],
                Text(label),
              ],
            ),
    );
  }
}
