import 'dart:async';

import 'package:domain/domain.dart';

import 'maya_api_services.dart';

class MayaServices implements AuthenticationRepository {
  MayaServices({required final MayaApiServices mayaApiServices})
    : _mayaApiServices = mayaApiServices;

  final MayaApiServices _mayaApiServices;

  @override
  Future<Result<AuthenticationEntity>> signIn({
    required final String email,
    required final String password,
  }) async {
    try {
      await _mayaApiServices.signIn(email: email, password: password);

      final authenticationEntity = AuthenticationEntity.signedIn(
        email: email,
        password: password,
      );

      return Success(
        authenticationEntity,
        onRetry: () => signIn(email: email, password: password),
      );
    } catch (error, stackTrace) {
      return UnknownFailure(
        message: error.toString(),
        onRetry: () => signIn(email: email, password: password),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<Result<AuthenticationEntity>> signOut() async {
    try {
      await _mayaApiServices.logout();

      return Success(AuthenticationEntity.signedOut(), onRetry: signOut);
    } catch (error, stackTrace) {
      return UnknownFailure(
        message: error.toString(),
        onRetry: signOut,
        stackTrace: stackTrace,
      );
    }
  }
}
