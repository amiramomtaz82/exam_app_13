import '../../../domain/entity/answer_entity.dart';

class AnswersDTO {
  AnswersDTO({
    this.answer,
    this.key,});

  AnswersDTO.fromJson(dynamic json) {
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



  AnswerEntity toEntity() {
    return AnswerEntity(
      answer: answer ?? '',
      key: key ?? '',
    );
  }

}