
import 'package:json_annotation/json_annotation.dart';

part 'interest_response.g.dart';

@JsonSerializable()
class InterestResponse {

  @JsonKey(name: "tags", defaultValue: [])
  List<String> tags;

  InterestResponse({required this.tags});

  factory InterestResponse.fromJson(Map<String, dynamic> json) =>
      _$InterestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InterestResponseToJson(this);
}