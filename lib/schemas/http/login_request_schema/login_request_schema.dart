import 'package:json_annotation/json_annotation.dart';
part 'login_request_schema.g.dart';

@JsonSerializable()
class LoginRequestSchema {
  String? email;
  String? password;

  LoginRequestSchema({
    this.email,
    this.password,
  });
  factory LoginRequestSchema.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestSchemaFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LoginRequestSchemaToJson(this);
}
