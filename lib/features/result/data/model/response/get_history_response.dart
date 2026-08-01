/// message : "success"
/// history : {"_id":"6a6c4572d2ea07268fb2f073","checkAnswer":"correct","QID":{"_id":"69e1a04704da0d4cf556aaee","question":"How can you open a link in a new tab/browser window?","answers":[{"answer":"<a href='url' new>","key":"A1"},{"answer":"<a href='url' target='new'>","key":"A2"},{"answer":"<a href='url' target='_blank'>","key":"A3"},{"answer":"~","key":"A4"}],"type":"single_choice","correct":"A3","subject":"670037f6728c92b7fdf434fc","exam":"670070a830a3c3c1944a9c63","createdAt":"2026-04-17T02:51:51.464Z"},"user":"6a6c3c52d2ea07268fb2f046","chosenAnswer":"A3","avgAnswerTime":"5","createdAt":"2026-07-31T06:49:22.526Z"}

class GetHistoryResponse {
  GetHistoryResponse({
      this.message, 
      this.history,});

  GetHistoryResponse.fromJson(dynamic json) {
    message = json['message'];
    history = json['history'] != null ? History.fromJson(json['history']) : null;
  }
  String? message;
  History? history;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (history != null) {
      map['history'] = history?.toJson();
    }
    return map;
  }

}

/// _id : "6a6c4572d2ea07268fb2f073"
/// checkAnswer : "correct"
/// QID : {"_id":"69e1a04704da0d4cf556aaee","question":"How can you open a link in a new tab/browser window?","answers":[{"answer":"<a href='url' new>","key":"A1"},{"answer":"<a href='url' target='new'>","key":"A2"},{"answer":"<a href='url' target='_blank'>","key":"A3"},{"answer":"~","key":"A4"}],"type":"single_choice","correct":"A3","subject":"670037f6728c92b7fdf434fc","exam":"670070a830a3c3c1944a9c63","createdAt":"2026-04-17T02:51:51.464Z"}
/// user : "6a6c3c52d2ea07268fb2f046"
/// chosenAnswer : "A3"
/// avgAnswerTime : "5"
/// createdAt : "2026-07-31T06:49:22.526Z"

class History {
  History({
      this.id, 
      this.checkAnswer, 
      this.qid, 
      this.user, 
      this.chosenAnswer, 
      this.avgAnswerTime, 
      this.createdAt,});

  History.fromJson(dynamic json) {
    id = json['_id'];
    checkAnswer = json['checkAnswer'];
    qid = json['QID'] != null ? Qid.fromJson(json['QID']) : null;
    user = json['user'];
    chosenAnswer = json['chosenAnswer'];
    avgAnswerTime = json['avgAnswerTime'];
    createdAt = json['createdAt'];
  }
  String? id;
  String? checkAnswer;
  Qid? qid;
  String? user;
  String? chosenAnswer;
  String? avgAnswerTime;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['checkAnswer'] = checkAnswer;
    if (qid != null) {
      map['QID'] = qid?.toJson();
    }
    map['user'] = user;
    map['chosenAnswer'] = chosenAnswer;
    map['avgAnswerTime'] = avgAnswerTime;
    map['createdAt'] = createdAt;
    return map;
  }

}

/// _id : "69e1a04704da0d4cf556aaee"
/// question : "How can you open a link in a new tab/browser window?"
/// answers : [{"answer":"<a href='url' new>","key":"A1"},{"answer":"<a href='url' target='new'>","key":"A2"},{"answer":"<a href='url' target='_blank'>","key":"A3"},{"answer":"~","key":"A4"}]
/// type : "single_choice"
/// correct : "A3"
/// subject : "670037f6728c92b7fdf434fc"
/// exam : "670070a830a3c3c1944a9c63"
/// createdAt : "2026-04-17T02:51:51.464Z"

class Qid {
  Qid({
      this.id, 
      this.question, 
      this.answers, 
      this.type, 
      this.correct, 
      this.subject, 
      this.exam, 
      this.createdAt,});

  Qid.fromJson(dynamic json) {
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
  String? subject;
  String? exam;
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