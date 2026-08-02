import 'package:exam_app/feature/auth/login&&regestier/domain/models/auth_result_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_response_dto.g.dart';

@JsonSerializable()
class AuthResponseDto {
  final String? message;
  final String? token;

  const AuthResponseDto({
    this.message,
    this.token,
  });

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseDtoToJson(this);
}

extension AuthResponseDtoMapper on AuthResponseDto {
  AuthResultEntity toDomain() {
    return AuthResultEntity(
      token: token ?? '',
      message: message ?? '',
    );
  }
}
