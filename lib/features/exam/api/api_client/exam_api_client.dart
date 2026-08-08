


import 'package:dio/dio.dart';
import 'package:exam_app_13/features/exam/data/models/response/get_Questions_by_exam_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/app_strings/endpoints.dart';



part 'exam_api_client.g.dart';
@singleton
@RestApi()
abstract class ExamApiClient {
  @factoryMethod
  factory ExamApiClient(Dio dio) = _ExamApiClient;


  @GET(Endpoints.getAllQuestionByExam)
  Future<HttpResponse<GetQuestionsByExamResponse>> getAllQuestionByExam( @Query("exam") String examId,);



}