import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class EditProfileRequestDto {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? username;

  EditProfileRequestDto({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.username,
  });

  factory EditProfileRequestDto.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$EditProfileRequestDtoToJson(this);
}