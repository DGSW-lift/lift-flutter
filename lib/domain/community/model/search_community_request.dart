
import 'package:json_annotation/json_annotation.dart';

part 'search_community_request.g.dart';

@JsonSerializable()
class SearchCommunityRequest {

  @JsonKey(name: "page")
  int page;
  @JsonKey(name: "size")
  int size;

  SearchCommunityRequest(this.page, this.size);

  factory SearchCommunityRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchCommunityRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchCommunityRequestToJson(this);
}
