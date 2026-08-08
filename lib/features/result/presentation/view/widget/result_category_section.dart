import 'package:exam_app_13/core/app_theme/app_colors.dart';
import 'package:exam_app_13/features/result/domain/entity/result_entity.dart';
import 'package:exam_app_13/features/result/presentation/view/widget/result_card.dart';
import 'package:flutter/material.dart';

class ResultCategorySection extends StatelessWidget {
  final String category;
  final List<ResultEntity> results;

  const ResultCategorySection({
    super.key,
    required this.category,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = LightColors();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: colors.textPrimary,
              ),
        ),
        const SizedBox(height: 8),
        ...results.map(
          (result) => ResultCard(result: result),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
