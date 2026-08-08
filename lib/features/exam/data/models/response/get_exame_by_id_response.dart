/// message : "success"
/// exam : {"_id":"69d9801a7c82914570305e5d","title":"React Basics","duration":25,"subject":"69d980117c82914570305dc9","numberOfQuestions":10,"active":true,"createdAt":"2026-04-10T22:56:26.636Z"}

class GetExameByIdResponse {
  GetExameByIdResponse({
      this.message, 
      this.exam,});

  GetExameByIdResponse.fromJson(dynamic json) {
    message = json['message'];
    exam = json['exam'] != null ? Exam.fromJson(json['exam']) : null;
  }
  String? message;
  Exam? exam;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (exam != null) {
      map['exam'] = exam?.toJson();
    }
    return map;
  }

}

/// _id : "69d9801a7c82914570305e5d"
/// title : "React Basics"
/// duration : 25
/// subject : "69d980117c82914570305dc9"
/// numberOfQuestions : 10
/// active : true
/// createdAt : "2026-04-10T22:56:26.636Z"

class Exam {
  Exam({
      this.id, 
      this.title, 
      this.duration, 
      this.subject, 
      this.numberOfQuestions, 
      this.active, 
      this.createdAt,});

  Exam.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    duration = json['duration'];
    subject = json['subject'];
    numberOfQuestions = json['numberOfQuestions'];
    active = json['active'];
    createdAt = json['createdAt'];
  }
  String? id;
  String? title;
  num? duration;
  String? subject;
  num? numberOfQuestions;
  bool? active;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['duration'] = duration;
    map['subject'] = subject;
    map['numberOfQuestions'] = numberOfQuestions;
    map['active'] = active;
    map['createdAt'] = createdAt;
    return map;
  }

}