// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hire_detail_company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HireDetailCompany _$HireDetailCompanyFromJson(Map<String, dynamic> json) =>
    HireDetailCompany(
      json['id'] as int,
      json['compId'] as int,
      json['title'] as String,
      json['exprMin'] as int? ?? 0,
      json['exprMax'] as int? ?? 0,
      json['positionDetails'] as String,
      json['mainWork'] as String,
      json['hireCondition'] as String,
      json['hospitality'] as String,
      json['welfare'] as String,
      json['name'] as String,
      json['introduction'] as String,
      json['address'] as String,
      json['tel'] as String,
      json['img'] as String,
      json['deadlineDate'] as String,
      json['createdDate'] as String,
    );

Map<String, dynamic> _$HireDetailCompanyToJson(HireDetailCompany instance) =>
    <String, dynamic>{
      'id': instance.id,
      'compId': instance.compId,
      'title': instance.title,
      'exprMin': instance.exprMin,
      'exprMax': instance.exprMax,
      'positionDetails': instance.positionDetails,
      'mainWork': instance.mainWork,
      'hireCondition': instance.hireCondition,
      'hospitality': instance.hospitality,
      'welfare': instance.welfare,
      'name': instance.name,
      'introduction': instance.introduction,
      'address': instance.address,
      'tel': instance.tel,
      'img': instance.img,
      'deadlineDate': instance.deadlineDate,
      'createdDate': instance.createdDate,
    };
