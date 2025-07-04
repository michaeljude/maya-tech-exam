import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_entity.freezed.dart';

@freezed
abstract class SessionEntity with _$SessionEntity {
  factory SessionEntity({
    required final String accessToken,
    required final int? expiresIn,
    required final String? refreshToken,
  }) = _SessionEntity;
}
