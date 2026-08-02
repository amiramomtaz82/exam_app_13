import 'package:json_annotation/json_annotation.dart';

part 'signin_request_dto.g.dart';

@JsonSerializable()
class SigninRequestDto {
  final String email;
  final String password;

  const SigninRequestDto({
    required this.email,
    required this.password,
  });

  factory SigninRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SigninRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SigninRequestDtoToJson(this);
}
