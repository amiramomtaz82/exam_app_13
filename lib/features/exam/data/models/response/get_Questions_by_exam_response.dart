import 'package:exam_app_13/features/exam/data/models/response/Question_DTO.dart';

/// message : "success"
/// questions : [{"_id":"69e1a04704da0d4cf556aaee","question":"How can you open a link in a new tab/browser window?","answers":[{"answer":"<a href='url' new>","key":"A1"},{"answer":"<a href='url' target='new'>","key":"A2"},{"answer":"<a href='url' target='_blank'>","key":"A3"},{"answer":"~","key":"A4"}],"type":"single_choice","correct":"A3","subject":null,"exam":null,"createdAt":"2026-04-17T02:51:51.464Z"},{"_id":"6a60cf7fd2ea07268fb2e696","question":"How can you open a link in a new tab/browser window?","answers":[{"answer":"<a href='url' new>","key":"A1"},{"answer":"<a href='url' target='new'>","key":"A2"},{"answer":"<a href='url' target='_blank'>","key":"A3"},{"answer":"~","key":"A4"}],"type":"single_choice","correct":"A3","subject":null,"exam":null,"createdAt":"2026-07-22T14:11:11.502Z"}]

class GetQuestionsByExamResponse {
  GetQuestionsByExamResponse({
      this.message, 
      this.questions,});

  GetQuestionsByExamResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['questions'] != null) {
      questions = [];
      json['questions'].forEach((v) {
        questions?.add(QuestionDTO.fromJson(v));
      });
    }
  }
  String? message;
  List<QuestionDTO>? questions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (questions != null) {
      map['questions'] = questions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "69e1a04704da0d4cf556aaee"
/// question : "How can you open a link in a new tab/browser window?"
/// answers : [{"answer":"<a href='url' new>","key":"A1"},{"answer":"<a href='url' target='new'>","key":"A2"},{"answer":"<a href='url' target='_blank'>","key":"A3"},{"answer":"~","key":"A4"}]
/// type : "single_choice"
/// correct : "A3"
/// subject : null
/// exam : null
/// createdAt : "2026-04-17T02:51:51.464Z"


/// answer : "<a href='url' new>"
/// key : "A1"

