import 'package:json_annotation/json_annotation.dart';
import 'package:lift/domain/community/model/community.dart';

part 'community_response.g.dart';

@JsonSerializable()
class CommunityResponse {
  @JsonKey(name: "data", defaultValue: [])
  List<Community> data;

  CommunityResponse({required this.data});

  factory CommunityResponse.fromJson(Map<String, dynamic> json) =>
      _$CommunityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityResponseToJson(this);
}
