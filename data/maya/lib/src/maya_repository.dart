import 'dart:async';

import 'package:collection/collection.dart';
import 'package:domain/domain.dart';

import 'maya_api_repository.dart';

class MayaRepository implements AuthenticationRepository, WalletRepository {
  MayaRepository({required final MayaApiRepository mayaApiRepository})
    : _mayaApiRepository = mayaApiRepository;

  final MayaApiRepository _mayaApiRepository;

  @override
  Future<Result<AuthenticationEntity>> signIn({
    required final String email,
    required final String password,
  }) async {
    try {
      await _mayaApiRepository.signIn(email: email, password: password);

      final users = await _mayaApiRepository.getUsers();

      final user = users.firstWhereOrNull((final user) => user.email == email);

      if (user == null) {
        throw Exception('User not found');
      }

      final authenticationEntity = AuthenticationEntity.signedIn(
        email: email,
        password: password,
        username: user.username,
        name: user.name,
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
      await _mayaApiRepository.logout();

      return Success(AuthenticationEntity.signedOut(), onRetry: signOut);
    } catch (error, stackTrace) {
      return UnknownFailure(
        message: error.toString(),
        onRetry: signOut,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<Result<void>> sendMoney({
    required final double amount,
    required final String recipient,
  }) async {
    try {
      await _mayaApiRepository.sendMoney(amount: amount, recipient: recipient);

      return Success(
        null,
        onRetry: () => sendMoney(amount: amount, recipient: recipient),
      );
    } catch (error, stackTrace) {
      return UnknownFailure(
        message: error.toString(),
        onRetry: () => sendMoney(amount: amount, recipient: recipient),
        stackTrace: stackTrace,
      );
    }
  }
}
