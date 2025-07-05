import 'dart:async';
import 'dart:convert';

import '../../domain.dart';
import '../entities/wallet_entity.dart';

class AuthenticationServiceImpl implements AuthenticationService {
  const AuthenticationServiceImpl({
    required final AuthenticationRepository authenticationRepository,
    required final LocalStorageService localStorageService,
  }) : _authenticationRepository = authenticationRepository,
       _localStorageService = localStorageService;

  final AuthenticationRepository _authenticationRepository;
  final LocalStorageService _localStorageService;

  @override
  Future<Result<AuthenticationEntity>> signIn({
    required final String email,
    required final String password,
  }) async {
    final result = await _authenticationRepository.signIn(
      email: email,
      password: password,
    );

    switch (result) {
      case Success(value: final value):
        if (value is SignedInAuthenticationEntity) {
          await _localStorageService.save('email', value: value.email);
          await _localStorageService.save('username', value: value.username);
          await _localStorageService.save('name', value: value.username);
          await _localStorageService.save(
            'wallet',
            value: jsonEncode(
              WalletEntity(
                name: 'Wallet - ${value.username}',
                balance: 10000,
              ).toJson(),
            ),
          );
          await _localStorageService.save(
            'isAuthenticated',
            value: 'authenticated',
          );
        }

      case Failure():
        break;
    }

    return result;
  }

  @override
  Future<Result<AuthenticationEntity>> signOut() async {
    final result = await _authenticationRepository.signOut();

    await _localStorageService.delete('email');

    await _localStorageService.delete('isAuthenticated');

    return result;
  }
}
