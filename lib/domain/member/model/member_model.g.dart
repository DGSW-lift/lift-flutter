// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberModel _$MemberModelFromJson(Map<String, dynamic> json) => MemberModel(
      json['id'] as int,
      json['email'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
      json['imgUrl'] as String,
      json['tel'] as String? ?? '',
      json['birth'] as String? ?? '',
      json['loginType'] as String,
      json['createdDate'] as String,
    );

Map<String, dynamic> _$MemberModelToJson(MemberModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'imgUrl': instance.imgUrl,
      'tel': instance.tel,
      'birth': instance.birth,
      'loginType': instance.loginType,
      'createdDate': instance.createdDate,
    };
