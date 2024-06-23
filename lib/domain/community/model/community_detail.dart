import 'package:json_annotation/json_annotation.dart';
import 'package:lift/domain/community/model/board_Image_response.dart';

part 'community_detail.g.dart';

@JsonSerializable()
class CommunityDetail {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "content")
  String content;

  @JsonKey(name: "createdDate")
  String createdDate;

  @JsonKey(name: "images", defaultValue: [])
  List<BoardImageResponse> images;


  CommunityDetail(
      this.id, this.title, this.content, this.createdDate, this.images);

  factory CommunityDetail.fromJson(Map<String, dynamic> json) =>
      _$CommunityDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityDetailToJson(this);
}
