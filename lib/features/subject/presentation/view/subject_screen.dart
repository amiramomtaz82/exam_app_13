

import 'package:exam_app_13/core/app_theme/app_colors.dart';
import 'package:exam_app_13/core/constants/app_strings/app_strings.dart';
import 'package:exam_app_13/core/widget/app_circular_indicator.dart';

import 'package:exam_app_13/features/subject/presentation/view/widget/subject_view.dart';
import 'package:exam_app_13/features/subject/presentation/view_model/subject_cubit.dart';

import 'package:exam_app_13/features/subject/presentation/view_model/subject_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_app_13/features/subject/presentation/view_model/subject_event.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors colors=LightColors();
    return SafeArea(
      child: Scaffold(
        body: Form(
          child: 
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [SizedBox(height: 15,),
                Text(AppStrings.survey,style: Theme.of(context).textTheme.titleLarge?.
                copyWith(color:colors.primary ),),
                SizedBox(height: 15,),

                SizedBox(height: 50,
                  //--------------------------------------
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),


                      hintText: AppStrings.search,
                      prefixIcon: Icon(Icons.search),
                    ),
                      onChanged:(value) {
                    context.read<SubjectCubit>().doEvents(
                      SearchSubjectsEvent(value),
                    );
                  },
                  ),
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(AppStrings.browseBySubject,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w400
                  ),
                ),),
                SizedBox(height: 15,),
            
                BlocBuilder<SubjectCubit,SubjectState>(

                  builder: (context,state) {
                    if(state.subjectsResource.isLoading){
                      return Center(child: AppCircularIndicator());
                    }
                    if(state.subjectsResource.isError){

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(state.subjectsResource.errorMessage!),
                      );

                    }
                    final subjects=state.filteredSubjects;
                    if (subjects.isEmpty) {
                      return const Expanded(
                        child: Center(
                          child: Text(
                            'No subjects found.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    }

                       return
                         Expanded(
                           child: ListView.builder(itemCount: subjects.length,
                               itemBuilder:(context,index)=>
                                  SubjectView(subject: subjects[index],)),
                         );
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
