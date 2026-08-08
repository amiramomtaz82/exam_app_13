import '../../../domain/entity/subject_entity.dart';

class SubjectsDTO {
  SubjectsDTO({
    this.id,
    this.name,
    this.icon,
    this.createdAt,});

  SubjectsDTO.fromJson(dynamic json) {
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
  SubjectEntity toEntity() {
    return SubjectEntity(
      id: id ?? '',
      name: name ?? '',
      icon: icon ?? '',
      createdAt: createdAt ?? '',
    );
  }
}