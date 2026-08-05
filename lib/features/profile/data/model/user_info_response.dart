import 'package:exam_app_13/features/profile/data/model/user_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_info_response.g.dart';

UserInfoResponse userInfoResponseFromJson(String str) => UserInfoResponse.fromJson(json.decode(str));

String userInfoResponseToJson(UserInfoResponse data) => json.encode(data.toJson());

@JsonSerializable()
class UserInfoResponse {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "user")
    UserDto? user;

    UserInfoResponse({
        this.message,
        this.user,
    });

    factory UserInfoResponse.fromJson(Map<String, dynamic> json) => _$UserInfoResponseFromJson(json);

    Map<String, dynamic> toJson() => _$UserInfoResponseToJson(this);
}
