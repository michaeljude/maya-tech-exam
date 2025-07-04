import '../entities/authentication_entity.dart';
import '../result/result.dart';

abstract class AuthenticationRepository {
  void connect();

  Future<void> signIn({
    required final String email,
    required final String password,
  });

  Future<void> signOut();

  Future<void> signUp({
    required final String email,
    required final String password,
  });

  Stream<Result<AuthenticationEntity?>> get authState;

  /// Initialize the storage to persist session.
  Future<void> initialize();

  /// Check if there is a persisted session.
  Future<bool> hasAccessToken();

  /// Get the access token from the current persisted session.
  Future<String?> accessToken();

  /// Remove the current persisted session.
  Future<void> removePersistedSession();

  /// Persist a session in the device.
  Future<void> persistSession(final String persistSessionString);

  Future<void> dispose();
}
