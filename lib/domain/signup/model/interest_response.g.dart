// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interest_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterestResponse _$InterestResponseFromJson(Map<String, dynamic> json) =>
    InterestResponse(
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
    );

Map<String, dynamic> _$InterestResponseToJson(InterestResponse instance) =>
    <String, dynamic>{
      'tags': instance.tags,
    };
