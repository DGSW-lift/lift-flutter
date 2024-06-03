import 'package:json_annotation/json_annotation.dart';

part 'member_model.g.dart';

@JsonSerializable()
class MemberModel {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "email")
  String email;

  @JsonKey(name: "firstName")
  String firstName;

  @JsonKey(name: "lastName")
  String lastName;

  @JsonKey(name: "imgUrl")
  String imgUrl;

  @JsonKey(name: "tel", defaultValue: "")
  String tel;

  @JsonKey(name: "birth", defaultValue: "")
  String birth;

  @JsonKey(name: "loginType")
  String loginType;

  @JsonKey(name: "createdDate")
  String createdDate;

  MemberModel(this.id, this.email, this.firstName, this.lastName, this.imgUrl,
      this.tel, this.birth, this.loginType, this.createdDate);

  factory MemberModel.fromJson(Map<String, dynamic> json) =>
      _$MemberModelFromJson(json);

  Map<String, dynamic> toJson() => _$MemberModelToJson(this);
}
