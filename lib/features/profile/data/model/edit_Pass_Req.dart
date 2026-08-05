
import 'package:json_annotation/json_annotation.dart';
part 'edit_pass_req.g.dart';
@JsonSerializable()
class PassReq {
    @JsonKey(name: "oldPassword")
    String? oldPassword;
    @JsonKey(name: "password")
    String? password;
    @JsonKey(name: "rePassword")
    String? rePassword;

    PassReq({
        this.oldPassword,
        this.password,
        this.rePassword,
    });

    factory PassReq.fromJson(Map<String, dynamic> json) => _$PassReqFromJson(json);

    Map<String, dynamic> toJson() => _$PassReqToJson(this);
}
