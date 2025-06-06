// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestSchema _$LoginRequestSchemaFromJson(Map<String, dynamic> json) =>
    LoginRequestSchema(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LoginRequestSchemaToJson(LoginRequestSchema instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
