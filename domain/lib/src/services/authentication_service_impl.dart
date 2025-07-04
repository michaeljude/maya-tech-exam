import 'dart:async';

import '../entities/authentication_entity.dart';
import '../repositories/authentication_repository.dart';
import '../result/result.dart';
import 'authentication_service.dart';
import 'local_storage_service.dart';

class AuthenticationServiceImpl implements AuthenticationService {
  const AuthenticationServiceImpl({
    required final AuthenticationRepository authenticationRepository,
    required final LocalStorageService localStorageService,
  }) : _authenticationRepository = authenticationRepository,
       _localStorageService = localStorageService;

  final AuthenticationRepository _authenticationRepository;
  final LocalStorageService _localStorageService;

  @override
  void connect() => _authenticationRepository.connect();

  @override
  Stream<Result<AuthenticationEntity?>> get authState =>
      _authenticationRepository.authState;

  @override
  Future<Result<void>> signIn({
    required final String email,
    required final String password,
  }) async {
    await _authenticationRepository.signIn(email: email, password: password);

    return _localStorageService.save('isAuthenticated', value: 'authenticated');
  }

  @override
  Future<Result<void>> signUp({
    required final String email,
    required final String password,
  }) async {
    await _authenticationRepository.signUp(email: email, password: password);

    return _localStorageService.save('isAuthenticated', value: 'authenticated');
  }

  @override
  Future<void> signOut() async {
    await _authenticationRepository.signOut();
  }

  @override
  Future<bool> hasAccessToken() async =>
      _authenticationRepository.hasAccessToken();

  @override
  Future<String?> accessToken() async =>
      _authenticationRepository.accessToken();

  @override
  Future<void> removePersistedSession() async =>
      _authenticationRepository.removePersistedSession();

  @override
  Future<void> dispose() async {
    await _authenticationRepository.dispose();
  }

  @override
  Future<void> persistSession(final String persistSessionString) async =>
      _authenticationRepository.persistSession(persistSessionString);
}
