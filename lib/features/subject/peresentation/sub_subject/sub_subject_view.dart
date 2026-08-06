import 'package:exam_app_13/config/base_state/resource.dart';
import 'package:exam_app_13/config/di/di.dart';
import 'package:exam_app_13/core/widget/app_circular_indicator.dart';
import 'package:exam_app_13/features/subject/domain/entity/exam_entity.dart';
import 'package:exam_app_13/features/subject/peresentation/exam_details/exam_details_view.dart';
import 'package:exam_app_13/features/subject/peresentation/sub_subject/sub_subject_event.dart';
import 'package:exam_app_13/features/subject/peresentation/sub_subject/sub_subject_view_model.dart';
import 'package:exam_app_13/features/subject/peresentation/sub_subject/widgets/exam_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubSubjectView extends StatelessWidget {
  final String subjectName;

  const SubSubjectView({super.key, required this.subjectName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<SubSubjectViewModel>()..add(GetSubSubjectEvent(subjectName)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(subjectName),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<SubSubjectViewModel, Resource<List<ExamEntity>>>(
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
              var grouped = _groupBySubject(state.data!);
              return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: grouped.length,
                itemBuilder: (context, index) {
                  var entry = grouped.entries.elementAt(index);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          entry.key,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      ...entry.value.map((exam) => ExamCardWidget(
                            exam: exam,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ExamDetailsView(
                                    examId: exam.id ?? '',
                                    subjectName: subjectName,
                                  ),
                                ),
                              );
                            },
                          )),
                    ],
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Map<String, List<ExamEntity>> _groupBySubject(List<ExamEntity> exams) {
    var map = <String, List<ExamEntity>>{};
    for (var exam in exams) {
      var key = exam.subject ?? 'Other';
      map.putIfAbsent(key, () => []);
      map[key]!.add(exam);
    }
    return map;
  }
}
