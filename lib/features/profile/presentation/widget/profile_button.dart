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
    final bool enabled = onPressed != null && !isLoading;

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          disabledBackgroundColor: colors.darkGrey,
          foregroundColor: colors.white,
          disabledForegroundColor: colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
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
      ),
    );
  }
}
