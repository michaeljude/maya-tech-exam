import '../entities/authentication_entity.dart';
import '../result/result.dart';

abstract class AuthenticationService {
  void connect();

  Future<Result<void>> signIn({
    required final String email,
    required final String password,
  });

  Future<Result<void>> signUp({
    required final String email,
    required final String password,
  });

  Future<void> signOut();

  Stream<Result<AuthenticationEntity?>> get authState;

  Future<bool> hasAccessToken();

  Future<String?> accessToken();

  Future<void> removePersistedSession();

  Future<void> persistSession(final String persistSessionString);

  Future<void> dispose();
}
