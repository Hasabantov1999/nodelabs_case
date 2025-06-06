// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestSchema _$RegisterRequestSchemaFromJson(
        Map<String, dynamic> json) =>
    RegisterRequestSchema(
      email: json['email'] as String?,
      name: json['name'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$RegisterRequestSchemaToJson(
        RegisterRequestSchema instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'password': instance.password,
    };
