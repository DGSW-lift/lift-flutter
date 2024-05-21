// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hire_company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HireCompany _$HireCompanyFromJson(Map<String, dynamic> json) => HireCompany(
      json['id'] as int,
      json['compId'] as int,
      json['title'] as String,
      json['exprMin'] as int,
      json['exprMax'] as int,
      json['name'] as String,
      json['address'] as String,
      json['img'] as String,
    );

Map<String, dynamic> _$HireCompanyToJson(HireCompany instance) =>
    <String, dynamic>{
      'id': instance.id,
      'compId': instance.compId,
      'title': instance.title,
      'exprMin': instance.exprMin,
      'exprMax': instance.exprMax,
      'name': instance.name,
      'address': instance.address,
      'img': instance.img,
    };
