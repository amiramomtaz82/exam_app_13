/// message : "success"
/// correct : 1
/// wrong : 1
/// total : "50%"
/// WrongQuestions : [{"QID":"6a60cf7fd2ea07268fb2e696","Question":"How can you open a link in a new tab/browser window?","inCorrectAnswer":"A4","correctAnswer":"A3","answers":{}}]
/// correctQuestions : [{"QID":"69e1a04704da0d4cf556aaee","Question":"How can you open a link in a new tab/browser window?","correctAnswer":"A3","answers":{}}]

class CheckQuestionResponse {
  CheckQuestionResponse({
      this.message, 
      this.correct, 
      this.wrong, 
      this.total, 
      this.wrongQuestions, 
      this.correctQuestions,});

  CheckQuestionResponse.fromJson(dynamic json) {
    message = json['message'];
    correct = json['correct'];
    wrong = json['wrong'];
    total = json['total'];
    if (json['WrongQuestions'] != null) {
      wrongQuestions = [];
      json['WrongQuestions'].forEach((v) {
        wrongQuestions?.add(WrongQuestions.fromJson(v));
      });
    }
    if (json['correctQuestions'] != null) {
      correctQuestions = [];
      json['correctQuestions'].forEach((v) {
        correctQuestions?.add(CorrectQuestions.fromJson(v));
      });
    }
  }
  String? message;
  num? correct;
  num? wrong;
  String? total;
  List<WrongQuestions>? wrongQuestions;
  List<CorrectQuestions>? correctQuestions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['correct'] = correct;
    map['wrong'] = wrong;
    map['total'] = total;
    if (wrongQuestions != null) {
      map['WrongQuestions'] = wrongQuestions?.map((v) => v.toJson()).toList();
    }
    if (correctQuestions != null) {
      map['correctQuestions'] = correctQuestions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// QID : "69e1a04704da0d4cf556aaee"
/// Question : "How can you open a link in a new tab/browser window?"
/// correctAnswer : "A3"
/// answers : {}

class CorrectQuestions {
  CorrectQuestions({
      this.qid, 
      this.question, 
      this.correctAnswer, 
      this.answers,});

  CorrectQuestions.fromJson(dynamic json) {
    qid = json['QID'];
    question = json['Question'];
    correctAnswer = json['correctAnswer'];
    answers = json['answers'];
  }
  String? qid;
  String? question;
  String? correctAnswer;
  dynamic answers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['QID'] = qid;
    map['Question'] = question;
    map['correctAnswer'] = correctAnswer;
    map['answers'] = answers;
    return map;
  }

}

/// QID : "6a60cf7fd2ea07268fb2e696"
/// Question : "How can you open a link in a new tab/browser window?"
/// inCorrectAnswer : "A4"
/// correctAnswer : "A3"
/// answers : {}

class WrongQuestions {
  WrongQuestions({
      this.qid, 
      this.question, 
      this.inCorrectAnswer, 
      this.correctAnswer, 
      this.answers,});

  WrongQuestions.fromJson(dynamic json) {
    qid = json['QID'];
    question = json['Question'];
    inCorrectAnswer = json['inCorrectAnswer'];
    correctAnswer = json['correctAnswer'];
    answers = json['answers'];
  }
  String? qid;
  String? question;
  String? inCorrectAnswer;
  String? correctAnswer;
  dynamic answers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['QID'] = qid;
    map['Question'] = question;
    map['inCorrectAnswer'] = inCorrectAnswer;
    map['correctAnswer'] = correctAnswer;
    map['answers'] = answers;
    return map;
  }

}