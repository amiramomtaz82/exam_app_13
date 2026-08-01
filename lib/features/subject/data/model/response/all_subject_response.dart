/// message : "success"
/// metadata : {"currentPage":1,"numberOfPages":1,"limit":40}
/// subjects : [{"_id":"69d980107c82914570305dbd","name":"JavaScript","icon":"https://exam.elevateegy.com/uploads/categories/seeder-javascript.png","createdAt":"2026-04-10T22:56:16.582Z"},{"_id":"69d980107c82914570305dc0","name":"Python","icon":"https://exam.elevateegy.com/uploads/categories/seeder-python.png","createdAt":"2026-04-10T22:56:16.757Z"},{"_id":"69d980107c82914570305dc3","name":"HTML & CSS","icon":"https://exam.elevateegy.com/uploads/categories/seeder-html.png","createdAt":"2026-04-10T22:56:16.940Z"},{"_id":"69d980117c82914570305dc6","name":"Data Struct","icon":"https://exam.elevateegy.com/uploads/categories/seeder-dsa.png","createdAt":"2026-04-10T22:56:17.111Z"},{"_id":"69d980117c82914570305dc9","name":"React.js","icon":"https://exam.elevateegy.com/uploads/categories/seeder-react.png","createdAt":"2026-04-10T22:56:17.279Z"},{"_id":"69d980117c82914570305dcc","name":"Node.js","icon":"https://exam.elevateegy.com/uploads/categories/seeder-nodejs.png","createdAt":"2026-04-10T22:56:17.465Z"},{"_id":"69d980117c82914570305dcf","name":"Databases","icon":"https://exam.elevateegy.com/uploads/categories/seeder-database.png","createdAt":"2026-04-10T22:56:17.634Z"},{"_id":"69d980117c82914570305dd2","name":"Git & DevOp","icon":"https://exam.elevateegy.com/uploads/categories/seeder-git.png","createdAt":"2026-04-10T22:56:17.805Z"},{"_id":"6a568d32d2ea07268fb2d62a","name":"Arabic","icon":"https://exam.elevateegy.com/uploads/categories/6a568d32d2ea07268fb2d628-Microscope.png","createdAt":"2026-07-14T19:25:38.223Z"}]

class AllSubjectResponse {
  AllSubjectResponse({
      this.message, 
      this.metadata, 
      this.subjects,});

  AllSubjectResponse.fromJson(dynamic json) {
    message = json['message'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['subjects'] != null) {
      subjects = [];
      json['subjects'].forEach((v) {
        subjects?.add(Subjects.fromJson(v));
      });
    }
  }
  String? message;
  Metadata? metadata;
  List<Subjects>? subjects;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (subjects != null) {
      map['subjects'] = subjects?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "69d980107c82914570305dbd"
/// name : "JavaScript"
/// icon : "https://exam.elevateegy.com/uploads/categories/seeder-javascript.png"
/// createdAt : "2026-04-10T22:56:16.582Z"

class Subjects {
  Subjects({
      this.id, 
      this.name, 
      this.icon, 
      this.createdAt,});

  Subjects.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    icon = json['icon'];
    createdAt = json['createdAt'];
  }
  String? id;
  String? name;
  String? icon;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['icon'] = icon;
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