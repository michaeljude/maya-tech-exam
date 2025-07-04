import 'package:freezed_annotation/freezed_annotation.dart';

import 'session_entity.dart';

part 'authentication_entity.freezed.dart';

@freezed
abstract class AuthenticationEntity with _$AuthenticationEntity {
  factory AuthenticationEntity.loading() = LoadingAuthenticationEntity;
  factory AuthenticationEntity.signedIn({
    required final List<String> permissions,
    required final List<String> roles,
    required final SessionEntity session,
  }) = SignedInAuthenticationEntity;

  factory AuthenticationEntity.signedOut({final String? errorMessage}) =
      SignedOutAuthenticationEntity;
}
