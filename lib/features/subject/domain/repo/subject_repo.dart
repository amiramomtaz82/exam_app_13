

import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/subject/domain/entity/subject_entity.dart';

abstract interface class SubjectRepo {

  Future<BaseResponse<List<SubjectEntity>>> getAllSubjects();


}