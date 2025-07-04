import 'dart:async';

import 'package:auto_route/auto_route.dart';

import 'package:domain/domain.dart';

import '../../router/app_router.gr.dart';

class LoginGuard extends AutoRouteGuard {
  const LoginGuard({required final LocalStorageService localStorageService})
    : _localStorageService = localStorageService;

  final LocalStorageService _localStorageService;

  @override
  Future<void> onNavigation(
    final NavigationResolver resolver,
    final StackRouter router,
  ) async {
    try {
      // Get the current auth state.
      final authState = await _localStorageService.get('isAuthenticated');

      final isAuthenticated = authState != null && authState == 'authenticated';

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
