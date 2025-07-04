import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_entity.freezed.dart';

@freezed
abstract class AuthenticationEntity with _$AuthenticationEntity {
  factory AuthenticationEntity.loading() = LoadingAuthenticationEntity;
  factory AuthenticationEntity.signedIn({
    required final String email,
    required final String password,
  }) = SignedInAuthenticationEntity;

  factory AuthenticationEntity.signedOut({final String? errorMessage}) =
      SignedOutAuthenticationEntity;
}
