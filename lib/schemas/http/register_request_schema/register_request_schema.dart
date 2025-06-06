import 'package:json_annotation/json_annotation.dart';
part 'register_request_schema.g.dart';

@JsonSerializable()
class RegisterRequestSchema {
  String? email;
  String? name;
  String? password;

  RegisterRequestSchema({this.email, this.name, this.password});
  factory RegisterRequestSchema.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestSchemaFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RegisterRequestSchemaToJson(this);
}
