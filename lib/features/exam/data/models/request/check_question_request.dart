/// answers : [{"questionId":"69e1a04704da0d4cf556aaee","correct":"A3"},{"questionId":"6a60cf7fd2ea07268fb2e696","correct":"A4"}]
/// time : 10

class CheckQuestionRequest {
  CheckQuestionRequest({
      this.answers, 
      this.time,});

  CheckQuestionRequest.fromJson(dynamic json) {
    if (json['answers'] != null) {
      answers = [];
      json['answers'].forEach((v) {
        answers?.add(Answers.fromJson(v));
      });
    }
    time = json['time'];
  }
  List<Answers>? answers;
  num? time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (answers != null) {
      map['answers'] = answers?.map((v) => v.toJson()).toList();
    }
    map['time'] = time;
    return map;
  }

}

/// questionId : "69e1a04704da0d4cf556aaee"
/// correct : "A3"

class Answers {
  Answers({
      this.questionId, 
      this.correct,});

  Answers.fromJson(dynamic json) {
    questionId = json['questionId'];
    correct = json['correct'];
  }
  String? questionId;
  String? correct;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['questionId'] = questionId;
    map['correct'] = correct;
    return map;
  }

}