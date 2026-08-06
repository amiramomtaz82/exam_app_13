import 'package:exam_app_13/features/subject/data/model/subject_exam_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_response_api.g.dart';
@JsonSerializable()
class SubjectResponseApi {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "metadata")
    Metadata? metadata;
    @JsonKey(name: "exams")
    List<ExamDto>? exams;

    SubjectResponseApi({
        this.message,
        this.metadata,
        this.exams,
    });

    factory SubjectResponseApi.fromJson(Map<String, dynamic> json) => _$SubjectResponseApiFromJson(json);

    Map<String, dynamic> toJson() => _$SubjectResponseApiToJson(this);
}

@JsonSerializable()
class Metadata {
    @JsonKey(name: "currentPage")
    int? currentPage;
    @JsonKey(name: "numberOfPages")
    int? numberOfPages;
    @JsonKey(name: "limit")
    int? limit;

    Metadata({
        this.currentPage,
        this.numberOfPages,
        this.limit,
    });

    factory Metadata.fromJson(Map<String, dynamic> json) => _$MetadataFromJson(json);

    Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
