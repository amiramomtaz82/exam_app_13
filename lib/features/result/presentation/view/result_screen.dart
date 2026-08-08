import 'package:exam_app_13/core/app_theme/app_colors.dart';
import 'package:exam_app_13/core/constants/app_strings/app_strings.dart';
import 'package:exam_app_13/core/widget/app_circular_indicator.dart';
import 'package:exam_app_13/features/result/presentation/view/widget/result_category_section.dart';
import 'package:exam_app_13/features/result/presentation/view_model/result_cubit.dart';
import 'package:exam_app_13/features/result/presentation/view_model/result_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = LightColors();

    return SafeArea(
      child: Scaffold(
        backgroundColor: colors.background,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Text(
                AppStrings.results,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: colors.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: BlocBuilder<ResultCubit, ResultState>(
                  builder: (context, state) {
                    if (state.resultsResource.isLoading) {
                      return Center(child: AppCircularIndicator());
                    }

                    if (state.resultsResource.isError) {
                      return Center(
                        child: Text(
                          state.resultsResource.errorMessage ??
                              AppStrings.somethingWentWrong,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }

                    if (state.groupedResults.isEmpty) {
                      return Center(
                        child: Text(
                          AppStrings.noResultsFound,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }

                    return ListView(
                      children: state.groupedResults.entries
                          .map(
                            (entry) => ResultCategorySection(
                              category: entry.key,
                              results: entry.value,
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
