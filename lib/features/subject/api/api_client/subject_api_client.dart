
import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';


import 'package:exam_app_13/core/constants/app_strings/endpoints.dart';
import 'package:exam_app_13/features/subject/data/model/response/all_subject_response.dart';



part 'subject_api_client.g.dart';
@singleton
@RestApi()
abstract class SubjectApiClient {
  @factoryMethod
  factory SubjectApiClient(Dio dio) = _SubjectApiClient;

  @GET(Endpoints.getAllSubjectEndPoint)
  Future<HttpResponse<AllSubjectResponse>> getAllSubjects();





}