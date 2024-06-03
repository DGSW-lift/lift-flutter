import 'package:json_annotation/json_annotation.dart';

part 'hire_company.g.dart';

@JsonSerializable()
class HireCompany {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "compId")
  int compId;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "exprMin")
  int exprMin;
  @JsonKey(name: "exprMax")
  int exprMax;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "address")
  String address;
  @JsonKey(name: "img")
  String img;

  HireCompany(
    this.id,
    this.compId,
    this.title,
    this.exprMin,
    this.exprMax,
    this.name,
    this.address,
    this.img,
  );

  factory HireCompany.fromJson(Map<String, dynamic> json) =>
      _$HireCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$HireCompanyToJson(this);
}
