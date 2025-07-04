import 'dart:async';

import 'package:domain/domain.dart';
import 'package:rxdart/subjects.dart';

class MayaServices implements AuthenticationRepository {
  final BehaviorSubject<Result<AuthenticationEntity?>?> _authStateController =
      BehaviorSubject.seeded(null);

  @override
  Stream<Result<AuthenticationEntity?>> get authState =>
      _authStateController.stream.map(
        (event) =>
            event ??
            UnknownFailure(
              message: 'Unknown failure',
              onRetry: () => signIn(email: '', password: ''),
              stackTrace: StackTrace.current,
            ),
      );

  @override
  Future<void> signIn({required String email, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  void dispose() {
    _authStateController.close();
  }
}
