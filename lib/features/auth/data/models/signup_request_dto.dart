import 'package:json_annotation/json_annotation.dart';

part 'signup_request_dto.g.dart';

@JsonSerializable()
class SignupRequestDto {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  const SignupRequestDto({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });

  factory SignupRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestDtoToJson(this);
}
