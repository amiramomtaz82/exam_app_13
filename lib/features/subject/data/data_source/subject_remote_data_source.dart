import 'package:exam_app_13/features/subject/data/model/response/all_subject_response.dart';

import '../../../../config/base_response/base_response.dart';
import '../model/response/subjectDTO.dart';

abstract class SubjectRemoteDataSource {
  Future<BaseResponse<List<SubjectsDTO>>> getAllSubjects();

}