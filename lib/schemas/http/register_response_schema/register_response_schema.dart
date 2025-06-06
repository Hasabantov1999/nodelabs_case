import 'package:json_annotation/json_annotation.dart';
import 'package:sinflix_app/core/network_exception_handler.dart';
import 'package:sinflix_app/schemas/http/login_response_schema/login_response_schema.dart';
part 'register_response_schema.g.dart';

@JsonSerializable()
class RegisterResponseSchema extends NetworkSchema<RegisterResponseSchema> {
  String? token;
  UserSchema? user;

  RegisterResponseSchema({this.token, this.user});
  factory RegisterResponseSchema.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseSchemaFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RegisterResponseSchemaToJson(this);

  @override
  RegisterResponseSchema fromJson(Map<String, dynamic> json) {
    return RegisterResponseSchema.fromJson(json);
  }
}
