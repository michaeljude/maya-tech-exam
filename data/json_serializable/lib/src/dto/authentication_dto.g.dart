// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationDto _$AuthenticationDtoFromJson(Map<String, dynamic> json) =>
    AuthenticationDto(
      email: json['email'] as String,
      username: json['username'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$AuthenticationDtoToJson(AuthenticationDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'name': instance.name,
    };
