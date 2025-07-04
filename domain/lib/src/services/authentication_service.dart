import '../../domain.dart';

abstract class AuthenticationService {
  Future<Result<AuthenticationEntity>> signIn({
    required final String email,
    required final String password,
  });

  Future<Result<AuthenticationEntity>> signOut();
}
