// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  token: json['token'] as String,
  role: json['role'] as String,
  username: json['username'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'role': instance.role,
      'username': instance.username,
      'email': instance.email,
    };
