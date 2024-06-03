import 'package:json_annotation/json_annotation.dart';
import 'package:lift/domain/hire/model/hire_company.dart';

part 'hire_company_response.g.dart';

@JsonSerializable()
class HireCompanyResponse {
  @JsonKey(name: "data", defaultValue: [])
  List<HireCompany> data;

  HireCompanyResponse({required this.data});

  factory HireCompanyResponse.fromJson(Map<String, dynamic> json) =>
      _$HireCompanyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HireCompanyResponseToJson(this);
}
