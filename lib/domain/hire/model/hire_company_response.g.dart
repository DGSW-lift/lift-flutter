// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hire_company_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HireCompanyResponse _$HireCompanyResponseFromJson(Map<String, dynamic> json) =>
    HireCompanyResponse(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => HireCompany.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$HireCompanyResponseToJson(
        HireCompanyResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
