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
        questions?.add(Questions.fromJson(v));
      });
    }
  }
  String? message;
  List<Questions>? questions;

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

class Questions {
  Questions({
      this.id, 
      this.question, 
      this.answers, 
      this.type, 
      this.correct, 
      this.subject, 
      this.exam, 
      this.createdAt,});

  Questions.fromJson(dynamic json) {
    id = json['_id'];
    question = json['question'];
    if (json['answers'] != null) {
      answers = [];
      json['answers'].forEach((v) {
        answers?.add(Answers.fromJson(v));
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
  List<Answers>? answers;
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

}

/// answer : "<a href='url' new>"
/// key : "A1"

class Answers {
  Answers({
      this.answer, 
      this.key,});

  Answers.fromJson(dynamic json) {
    answer = json['answer'];
    key = json['key'];
  }
  String? answer;
  String? key;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['answer'] = answer;
    map['key'] = key;
    return map;
  }

}