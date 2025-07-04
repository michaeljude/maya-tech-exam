import 'package:json_annotation/json_annotation.dart';

part 'authentication_dto.g.dart';

@JsonSerializable()
class AuthenticationDto {
  const AuthenticationDto({
    required this.email,
    required this.username,
    required this.name,
  });

  factory AuthenticationDto.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticationDtoToJson(this);

  final String email;
  final String username;
  final String name;
}
