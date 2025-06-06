// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseSchema _$RegisterResponseSchemaFromJson(
        Map<String, dynamic> json) =>
    RegisterResponseSchema(
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : UserSchema.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseSchemaToJson(
        RegisterResponseSchema instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };
