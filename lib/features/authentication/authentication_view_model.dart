import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/extension/cubit_extension.dart';
import 'authentication_view_state.dart';

class AuthenticationViewModel extends Cubit<AuthenticationViewState> {
  AuthenticationViewModel({
    required final AuthenticationService authenticationService,
    final GlobalKey<FormState>? formKey,
  }) : _authenticationService = authenticationService,
       super(
         AuthenticationViewState(
           formKey: formKey ?? GlobalKey<FormState>(),
           emailController: TextEditingController(),
           passwordController: TextEditingController(),
         ),
       );

  final AuthenticationService _authenticationService;

  Future<void> signIn() async {
    final currentState = state.formKey.currentState;
    currentState?.save();
    if (currentState == null || !currentState.validate()) {
      return;
    }

    safeEmit(state.copyWith(isLoading: true));

    final email = state.emailController.text;
    final password = state.passwordController.text;

    final result = await _authenticationService.signIn(
      email: email,
      password: password,
    );

    switch (result) {
      case Success():
        {
          state.emailController.clear();
          state.passwordController.clear();
          safeEmit(state.copyWith(isLoading: false, isSuccess: true));
        }
      case Failure():
        safeEmit(
          state.copyWith(isLoading: false, errorMessage: result.message),
        );
        safeEmit(state.copyWith(isLoading: false, errorMessage: null));
    }
  }

  Future<void> signOut({
    required final VoidCallback onSuccess,
    required final VoidCallback onFailure,
  }) async {
    safeEmit(state.copyWith(isSigningOut: true));
    final result = await _authenticationService.signOut();

    state.emailController.dispose();
    state.passwordController.dispose();
    safeEmit(
      AuthenticationViewState(
        formKey: GlobalKey<FormState>(),
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
      ),
    );

    switch (result) {
      case Success():
        onSuccess();
      case Failure():
        onFailure();
    }
  }

  @override
  Future<void> close() {
    state.emailController.dispose();
    state.passwordController.dispose();

    return super.close();
  }
}
