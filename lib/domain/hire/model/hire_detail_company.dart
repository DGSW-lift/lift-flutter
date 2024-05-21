import 'package:json_annotation/json_annotation.dart';

part 'hire_detail_company.g.dart';

@JsonSerializable()
class HireDetailCompany {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "compId")
  int compId;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "exprMin", defaultValue: 0)
  int exprMin;
  @JsonKey(name: "exprMax", defaultValue: 0)
  int exprMax;
  @JsonKey(name: "positionDetails")
  String positionDetails;
  @JsonKey(name: "mainWork")
  String mainWork;
  @JsonKey(name: "hireCondition")
  String hireCondition;
  @JsonKey(name: "hospitality")
  String hospitality;
  @JsonKey(name: "welfare")
  String welfare;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "introduction")
  String introduction;
  @JsonKey(name: "address")
  String address;
  @JsonKey(name: "tel")
  String tel;
  @JsonKey(name: "img")
  String img;
  @JsonKey(name: "deadlineDate")
  String deadlineDate;
  @JsonKey(name: "createdDate")
  String createdDate;


  HireDetailCompany(
      this.id,
      this.compId,
      this.title,
      this.exprMin,
      this.exprMax,
      this.positionDetails,
      this.mainWork,
      this.hireCondition,
      this.hospitality,
      this.welfare,
      this.name,
      this.introduction,
      this.address,
      this.tel,
      this.img,
      this.deadlineDate,
      this.createdDate);

  factory HireDetailCompany.fromJson(Map<String, dynamic> json) =>
      _$HireDetailCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$HireDetailCompanyToJson(this);
}
