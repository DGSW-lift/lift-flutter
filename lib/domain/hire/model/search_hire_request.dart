import 'package:json_annotation/json_annotation.dart';

part 'search_hire_request.g.dart';

@JsonSerializable()
class SearchHireRequest {
  @JsonKey(name: "page")
  int page;
  @JsonKey(name: "size")
  int size;

  SearchHireRequest(this.page, this.size);

  factory SearchHireRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchHireRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchHireRequestToJson(this);
}
