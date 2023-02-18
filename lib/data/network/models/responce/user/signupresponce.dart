
import 'package:json_annotation/json_annotation.dart';
part 'signupresponce.g.dart';

@JsonSerializable()
class SignUpResponse {
  final User user;
  final bool success;
  final String token;


  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  SignUpResponse(this.user, this.token, this.success);
  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}


@JsonSerializable()
class User {
  final String? username,password,name,phone,device_token,email,role,franchise_id,updatedAt,createdAt;
  final int? id;
  final bool? is_deleted;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  User(this.username, this.password, this.name, this.phone, this.device_token, this.email, this.role, this.updatedAt, this.createdAt, this.id, this.franchise_id, this.is_deleted);


  Map<String, dynamic> toJson() => _$UserToJson(this);
}
