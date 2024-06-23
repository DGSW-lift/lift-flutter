import 'package:json_annotation/json_annotation.dart';

part 'board_Image_response.g.dart';

@JsonSerializable()
class BoardImageResponse {
  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "boardId", defaultValue: 0)
  int boardId;

  @JsonKey(name: "imageUrl")
  String imageUrl;

  BoardImageResponse(this.id, this.boardId, this.imageUrl);

  factory BoardImageResponse.fromJson(Map<String, dynamic> json) =>
      _$BoardImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BoardImageResponseToJson(this);
}
