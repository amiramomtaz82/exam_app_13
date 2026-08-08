import '../entity/result_entity.dart';

class ResultDto {
  const ResultDto({
    this.id,
    this.category,
    this.title,
    this.durationMinutes,
    this.questionCount,
    this.correctAnswersCount,
    this.completionTimeMinutes,
    this.iconType,
  });

  factory ResultDto.fromJson(dynamic json) {
    return ResultDto(
      id: json['id'],
      category: json['category'],
      title: json['title'],
      durationMinutes: json['durationMinutes'],
      questionCount: json['questionCount'],
      correctAnswersCount: json['correctAnswersCount'],
      completionTimeMinutes: json['completionTimeMinutes'],
      iconType: json['iconType'],
    );
  }

  final String? id;
  final String? category;
  final String? title;
  final int? durationMinutes;
  final int? questionCount;
  final int? correctAnswersCount;
  final int? completionTimeMinutes;
  final String? iconType;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'title': title,
      'durationMinutes': durationMinutes,
      'questionCount': questionCount,
      'correctAnswersCount': correctAnswersCount,
      'completionTimeMinutes': completionTimeMinutes,
      'iconType': iconType,
    };
  }

  ResultIconType _parseIconType(String? value) {
    switch (value) {
      case 'math':
        return ResultIconType.math;
      case 'language':
      default:
        return ResultIconType.language;
    }
  }

  ResultEntity toEntity() {
    return ResultEntity(
      id: id ?? '',
      category: category ?? '',
      title: title ?? '',
      durationMinutes: durationMinutes ?? 0,
      questionCount: questionCount ?? 0,
      correctAnswersCount: correctAnswersCount ?? 0,
      completionTimeMinutes: completionTimeMinutes ?? 0,
      iconType: _parseIconType(iconType),
    );
  }
}
