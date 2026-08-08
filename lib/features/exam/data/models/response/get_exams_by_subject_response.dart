/// message : "success"
/// metadata : {"currentPage":1,"numberOfPages":1,"limit":40}
/// exams : [{"_id":"69d9801a7c82914570305e5d","title":"React Basics","duration":25,"subject":"69d980117c82914570305dc9","numberOfQuestions":10,"active":true,"createdAt":"2026-04-10T22:56:26.636Z"},{"_id":"69e25eff04da0d4cf556b31d","title":"React Quiz","duration":20,"subject":"69d980117c82914570305dc9","numberOfQuestions":10,"active":true,"createdAt":"2026-04-17T16:25:35.245Z"}]

class GetExamsBySubjectResponse {
  GetExamsBySubjectResponse({
      this.message, 
      this.metadata, 
      this.exams,});

  GetExamsBySubjectResponse.fromJson(dynamic json) {
    message = json['message'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['exams'] != null) {
      exams = [];
      json['exams'].forEach((v) {
        exams?.add(Exams.fromJson(v));
      });
    }
  }
  String? message;
  Metadata? metadata;
  List<Exams>? exams;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (exams != null) {
      map['exams'] = exams?.map((v) => v.toJson()).toList();
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

class Exams {
  Exams({
      this.id, 
      this.title, 
      this.duration, 
      this.subject, 
      this.numberOfQuestions, 
      this.active, 
      this.createdAt,});

  Exams.fromJson(dynamic json) {
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

/// currentPage : 1
/// numberOfPages : 1
/// limit : 40

class Metadata {
  Metadata({
      this.currentPage, 
      this.numberOfPages, 
      this.limit,});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
  num? currentPage;
  num? numberOfPages;
  num? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }

}