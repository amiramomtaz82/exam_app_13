// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SigninRequestDto _$SigninRequestDtoFromJson(Map<String, dynamic> json) =>
    SigninRequestDto(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SigninRequestDtoToJson(SigninRequestDto instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};
