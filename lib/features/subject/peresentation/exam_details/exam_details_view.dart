import 'package:exam_app_13/config/base_state/resource.dart';
import 'package:exam_app_13/config/di/di.dart';
import 'package:exam_app_13/core/widget/app_circular_indicator.dart';
import 'package:exam_app_13/features/subject/domain/entity/exam_entity.dart';
import 'package:exam_app_13/features/subject/peresentation/exam_details/exam_details_event.dart';
import 'package:exam_app_13/features/subject/peresentation/exam_details/exam_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamDetailsView extends StatelessWidget {
  final String examId;
  final String subjectName;

  const ExamDetailsView(
      {super.key, required this.examId, required this.subjectName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<ExamDetailsViewModel>()..add(GetExamDetailsEvent(examId)),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<ExamDetailsViewModel, Resource<ExamEntity>>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: AppCircularIndicator());
            }
            if (state.isError) {
              return Center(
                child: Text(state.errorMessage ?? ''),
              );
            }
            if (state.isSuccess && state.data != null) {
              var exam = state.data!;
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.menu_book, size: 28),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            subjectName,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        Text(
                          '${exam.duration ?? 0} Minutes',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '${exam.title ?? ''} | ${exam.numberOfQuestions ?? 0} Question',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Instructions',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    ...List.generate(
                      4,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('•  ',
                                style:
                                    Theme.of(context).textTheme.bodyMedium),
                            Expanded(
                              child: Text(
                                'Lorem ipsum dolor sit amet consectetur.',
                                style:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Start'),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
