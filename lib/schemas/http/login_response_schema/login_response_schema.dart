import 'package:json_annotation/json_annotation.dart';
import 'package:sinflix_app/core/network_exception_handler.dart';
part 'login_response_schema.g.dart';

@JsonSerializable()
class LoginResponseSchema extends NetworkSchema<LoginResponseSchema> {
  String? token;
  UserSchema? user;

  LoginResponseSchema({this.token, this.user});
  factory LoginResponseSchema.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseSchemaFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginResponseSchemaToJson(this);

  @override
  LoginResponseSchema fromJson(Map<String, dynamic> json) {
    return LoginResponseSchema.fromJson(json);
  }
}

@JsonSerializable()
class UserSchema {
  String? id;
  String? name;
  String? email;

  UserSchema({this.id, this.name, this.email});
  factory UserSchema.fromJson(Map<String, dynamic> json) =>
      _$UserSchemaFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserSchemaToJson(this);
}
