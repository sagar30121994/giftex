// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signupresponce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      User.fromJson(json['user'] as Map<String, dynamic>),
      json['token'] as String,
      json['success'] as bool,
    );

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'success': instance.success,
      'token': instance.token,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['username'] as String?,
      json['password'] as String?,
      json['name'] as String?,
      json['phone'] as String?,
      json['device_token'] as String?,
      json['email'] as String?,
      json['role'] as String?,
      json['updatedAt'] as String?,
      json['createdAt'] as String?,
      json['id'] as int?,
      json['franchise_id'] as String?,
      json['is_deleted'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'name': instance.name,
      'phone': instance.phone,
      'device_token': instance.device_token,
      'email': instance.email,
      'role': instance.role,
      'franchise_id': instance.franchise_id,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'id': instance.id,
      'is_deleted': instance.is_deleted,
    };
