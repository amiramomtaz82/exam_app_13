import 'package:exam_app_13/features/subject/data/model/subject_exam_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'spefic_exam_response.g.dart';

@JsonSerializable()
class SpecficExamResponseApi {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "exam")
    ExamDto? exam;

    SpecficExamResponseApi({
        this.message,
        this.exam,
    });

    factory SpecficExamResponseApi.fromJson(Map<String, dynamic> json) => _$SpecficExamResponseApiFromJson(json);

    Map<String, dynamic> toJson() => _$SpecficExamResponseApiToJson(this);
}
