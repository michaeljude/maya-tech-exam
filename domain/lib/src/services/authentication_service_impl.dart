import 'dart:async';

import '../../domain.dart';

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

    await _localStorageService.save('email', value: email);
    await _localStorageService.save('password', value: password);

    await _localStorageService.save('isAuthenticated', value: 'authenticated');

    return result;
  }

  @override
  Future<Result<AuthenticationEntity>> signOut() async {
    final result = await _authenticationRepository.signOut();

    await _localStorageService.delete('email');
    await _localStorageService.delete('password');

    await _localStorageService.delete('isAuthenticated');

    return result;
  }
}
