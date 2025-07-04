import '../entities/authentication_entity.dart';
import '../result/result.dart';

abstract class AuthenticationRepository {
  Future<Result<AuthenticationEntity>> signIn({
    required final String email,
    required final String password,
  });

  Future<Result<AuthenticationEntity>> signOut();
}
