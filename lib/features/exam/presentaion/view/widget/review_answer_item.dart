import 'package:exam_app_13/core/app_theme/app_colors.dart';
import 'package:flutter/material.dart';

class ReviewAnswerItem extends StatelessWidget {
  final String answer;
  final bool isCorrect;
  final bool isSelected;

  const ReviewAnswerItem({
    super.key,
    required this.answer,
    required this.isCorrect,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    AppColors colors=LightColors();
    Color borderColor;
    Color backgroundColor;
    IconData icon;
    Color iconColor;

    if (isCorrect) {
      borderColor = colors.success;
      backgroundColor = colors.lightGreen;
      icon = Icons.check_box_sharp;
      iconColor = colors.success;
    } else if (isSelected) {
      borderColor = colors.error;
      backgroundColor = colors.lightRed;
      icon = Icons.check_box_sharp;
      iconColor = colors.error;
    } else {
      borderColor = colors.lightBlue;
      backgroundColor = colors.lightBlue;
      icon = Icons.square_outlined;
      iconColor =colors.primary;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              answer,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}