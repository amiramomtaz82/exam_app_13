import 'package:exam_app_13/core/app_theme/app_colors.dart';
import 'package:exam_app_13/features/subject/domain/entity/subject_entity.dart';
import 'package:flutter/material.dart';

class SubjectView extends StatelessWidget {
  final SubjectEntity subject;

  const SubjectView({
    super.key,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = LightColors();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: InkWell(onTap: (){},
        child: Container(
          height: 75,
          decoration: BoxDecoration(
            color: colors.white,
            boxShadow: [
              BoxShadow(
                color: colors.darkGrey.withOpacity(0.4),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(
              color: colors.grey.withAlpha(100),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const SizedBox(width: 7),
              Image.network(
                subject.icon,
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 10),
              Text(subject.name),
            ],
          ),
        ),
      ),
    );
  }
}