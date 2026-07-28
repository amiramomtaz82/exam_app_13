
import '../../../domain/entity/forget_password_entity.dart';

/// message : "Reset code sent successfully"

class ForgetPasswordResponse {
  ForgetPasswordResponse({
    this.message,});

  ForgetPasswordResponse.fromJson(dynamic json) {
    message = json['message'];
  }
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }
  toEntity(){
    return ForgetPasswordEntity(message: message??"");



  }

}