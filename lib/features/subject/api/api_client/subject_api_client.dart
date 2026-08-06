import 'package:dio/dio.dart';
import 'package:exam_app_13/core/constants/app_strings/endpoints.dart';
import 'package:exam_app_13/features/subject/data/model/spefic_exam_response.dart';
import 'package:exam_app_13/features/subject/data/model/subject_response_api.dart';
import 'package:retrofit/retrofit.dart';

part 'subject_api_client.g.dart';

@RestApi()
abstract class SubjectApiClient {
  factory SubjectApiClient(Dio dio) = _SubjectApiClient;

  @GET(Endpoints.getSubSubject)
  Future<SubjectResponseApi> getSubSubject(@Query('subject') String subject);

  @GET('${Endpoints.getExamById}/{id}')
  Future<SpecficExamResponseApi> getExamById(@Path('id') String id);
}
