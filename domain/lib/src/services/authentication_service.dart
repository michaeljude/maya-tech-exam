import '../entities/authentication_entity.dart';
import '../result/result.dart';

abstract class AuthenticationService {
  Future<Result<void>> signIn({
    required final String email,
    required final String password,
  });

  Future<void> signOut();

  Stream<Result<AuthenticationEntity?>> get authState;
}
