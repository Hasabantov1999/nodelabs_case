// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_response_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileResponseSchema _$UserProfileResponseSchemaFromJson(
        Map<String, dynamic> json) =>
    UserProfileResponseSchema(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$UserProfileResponseSchemaToJson(
        UserProfileResponseSchema instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
    };
