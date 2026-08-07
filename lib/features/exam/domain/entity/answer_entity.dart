import 'package:equatable/equatable.dart';

class AnswerEntity extends Equatable{
  final String answer;
  final String key;

  const AnswerEntity({
    required this.answer,
    required this.key,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [answer,key];
}