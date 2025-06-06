// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseSchema _$LoginResponseSchemaFromJson(Map<String, dynamic> json) =>
    LoginResponseSchema(
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : UserSchema.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseSchemaToJson(
        LoginResponseSchema instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };

UserSchema _$UserSchemaFromJson(Map<String, dynamic> json) => UserSchema(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserSchemaToJson(UserSchema instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
