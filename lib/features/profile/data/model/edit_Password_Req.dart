import 'package:json_annotation/json_annotation.dart';
part 'edit_password_req.g.dart';
@JsonSerializable()
class EditPassRespone {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "token")
    String? token;

    EditPassRespone({
        this.message,
        this.token,
    });

    factory EditPassRespone.fromJson(Map<String, dynamic> json) => _$EditPassResponeFromJson(json);

    Map<String, dynamic> toJson() => _$EditPassResponeToJson(this);
}
