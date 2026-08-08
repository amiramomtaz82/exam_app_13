import 'package:exam_app_13/features/exam/domain/entity/questions_entity.dart';

import 'answer_DTO.dart';

class QuestionDTO {
  QuestionDTO({
    this.id,
    this.question,
    this.answers,
    this.type,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,});

  QuestionDTO.fromJson(dynamic json) {
    id = json['_id'];
    question = json['question'];
    if (json['answers'] != null) {
      answers = [];
      json['answers'].forEach((v) {
        answers?.add(AnswersDTO.fromJson(v));
      });
    }
    type = json['type'];
    correct = json['correct'];
    subject = json['subject'];
    exam = json['exam'];
    createdAt = json['createdAt'];
  }
  String? id;
  String? question;
  List<AnswersDTO>? answers;
  String? type;
  String? correct;
  dynamic subject;
  dynamic exam;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['question'] = question;
    if (answers != null) {
      map['answers'] = answers?.map((v) => v.toJson()).toList();
    }
    map['type'] = type;
    map['correct'] = correct;
    map['subject'] = subject;
    map['exam'] = exam;
    map['createdAt'] = createdAt;
    return map;
  }


 QuestionEntity toEntity(){

    return   QuestionEntity(

      id: id??"",
      answers:answers?.map((e) => e.toEntity()).toList() ?? [],
      correctAnswerKey: correct??"",
      question: question??'',
      type: type??''

    );
  }
}
