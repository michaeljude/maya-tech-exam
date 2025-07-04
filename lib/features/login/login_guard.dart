import 'dart:async';

import 'package:auto_route/auto_route.dart';

import 'package:domain/domain.dart';

import '../../router/app_router.gr.dart';

class LoginGuard extends AutoRouteGuard {
  const LoginGuard({
    required final AuthenticationService authenticationService,
  }) : _authenticationService = authenticationService;

  final AuthenticationService _authenticationService;

  @override
  Future<void> onNavigation(
    final NavigationResolver resolver,
    final StackRouter router,
  ) async {
    try {
      // Get the current auth state.
      final authState = await _authenticationService.authState.first;

      final authEntity = switch (authState) {
        Success() => authState.value,
        Failure() => null,
      };

      final isAuthenticated = authEntity is SignedInAuthenticationEntity;

      if (isAuthenticated) {
        resolver.next();

        return;
      }
      // User is not authenticated, redirect to authentication.
      await resolver.redirectUntil(
        LoginRoute(
          onResult: ({required final isSuccessLogin}) =>
              resolver.next(isSuccessLogin),
        ),
      );
    } catch (_) {
      await resolver.redirectUntil(
        LoginRoute(
          onResult: ({required final isSuccessLogin}) =>
              resolver.next(isSuccessLogin),
        ),
      );
    }
  }
}
