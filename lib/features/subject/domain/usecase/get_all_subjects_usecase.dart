


import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/subject/data/data_source/subject_remote_data_source.dart';
import 'package:exam_app_13/features/subject/domain/entity/subject_entity.dart';
import 'package:exam_app_13/features/subject/domain/repo/subject_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllSubjectsUsecase {

SubjectRepo _subjectRepo;

  GetAllSubjectsUsecase(this._subjectRepo);

  Future<BaseResponse<List<SubjectEntity>>>
  call()=>_subjectRepo.getAllSubjects();
  }


