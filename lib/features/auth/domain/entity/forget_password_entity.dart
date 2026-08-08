


import 'package:equatable/equatable.dart';

class ForgetPasswordEntity extends Equatable{

   final String message;
  const ForgetPasswordEntity({required this.message});

   List<Object> get props => [message];



}