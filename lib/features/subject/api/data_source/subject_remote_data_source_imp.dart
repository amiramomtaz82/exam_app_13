

import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/features/subject/api/api_client/subject_api_client.dart';
import 'package:exam_app_13/features/subject/data/data_source/subject_remote_data_source.dart';
import 'package:exam_app_13/features/subject/data/model/response/all_subject_response.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/response/subject_dto.dart';

@Injectable(as:SubjectRemoteDataSource)

class SubjectRemoteDataSourceImp implements SubjectRemoteDataSource{

  final SubjectApiClient subjectApiClient;
  SubjectRemoteDataSourceImp (this.subjectApiClient);

  @override
  Future<BaseResponse<List<SubjectsDTO>>> getAllSubjects() async{


    try {
      final httpResponse = await subjectApiClient.getAllSubjects();

      final response = httpResponse.data;

      return SuccessResponse<List<SubjectsDTO>>(response.subjects ?? []);
    } on Exception catch (e) {
      return ErrorResponse<List<SubjectsDTO>>(error:e);
    }
  }

  }




