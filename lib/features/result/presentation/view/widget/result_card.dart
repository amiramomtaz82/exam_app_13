import 'package:exam_app_13/core/app_theme/app_colors.dart';
import 'package:exam_app_13/features/result/domain/entity/result_entity.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final ResultEntity result;

  const ResultCard({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = LightColors();
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: colors.darkGrey.withValues(alpha: 0.15),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ResultIcon(iconType: result.iconType, colors: colors),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                result.title,
                                style: textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: colors.textPrimary,
                                ),
                              ),
                            ),
                            Text(
                              result.durationLabel(result.durationMinutes),
                              style: textTheme.bodySmall?.copyWith(
                                color: colors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          result.questionCountLabel(result.questionCount),
                          style: textTheme.bodySmall?.copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: colors.lightBlue,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Text(
                result.summaryText,
                style: textTheme.bodyMedium?.copyWith(
                  color: colors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResultIcon extends StatelessWidget {
  final ResultIconType iconType;
  final AppColors colors;

  const _ResultIcon({
    required this.iconType,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    switch (iconType) {
      case ResultIconType.math:
        return Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: colors.lightGreen,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.calculate_outlined,
            color: colors.success,
            size: 28,
          ),
        );
      case ResultIconType.language:
        return Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: colors.lightBlue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.assignment_outlined,
            color: colors.primary,
            size: 28,
          ),
        );
    }
  }
}
