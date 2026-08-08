import 'package:equatable/equatable.dart';

import 'answer_entity.dart';

class QuestionEntity extends Equatable {
  final String id;
  final String question;
  final List<AnswerEntity> answers;
  final String type;
  final String correctAnswerKey;

  const QuestionEntity({
    required this.id,
    required this.question,
    required this.answers,
    required this.type,
    required this.correctAnswerKey,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id,question,answers,type,correctAnswerKey];
}