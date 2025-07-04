import 'package:json_annotation/json_annotation.dart';

part 'authentication_dto.g.dart';

@JsonSerializable()
class AuthenticationDto {
  const AuthenticationDto({
    required this.email,
    required this.username,
    required this.name,
  });
  factory AuthenticationDto.fromJson(final Map<String, dynamic> json) =>
      _$AuthenticationDtoFromJson(json);

  final String email;
  final String username;
  final String name;

  Map<String, dynamic> toJson() => _$AuthenticationDtoToJson(this);
}
