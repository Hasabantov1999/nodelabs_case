import 'package:json_annotation/json_annotation.dart';
import 'package:sinflix_app/core/network_exception_handler.dart';
part 'user_profile_response_schema.g.dart';

@JsonSerializable()
class UserProfileResponseSchema extends NetworkSchema {
  String? id;
  String? name;
  String? email;
  String? photoUrl;

  UserProfileResponseSchema({this.id, this.name, this.email, this.photoUrl});
  factory UserProfileResponseSchema.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseSchemaFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserProfileResponseSchemaToJson(this);

  @override
  fromJson(Map<String, dynamic> json) {
    return UserProfileResponseSchema.fromJson(json);
  }
}
