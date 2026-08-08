
import '../../../domain/entity/forget_password_entity.dart';

/// status : "success"
/// message : "Password reset successfully"

class ResetPasswordResponse {
  ResetPasswordResponse({
    this.status,
    this.message,});

  ResetPasswordResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }
  String? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }
  toEntity(){
    return ForgetPasswordEntity(message: message??"");



  }

}