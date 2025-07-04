import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_view_state.freezed.dart';

@freezed
abstract class AuthenticationViewState with _$AuthenticationViewState {
  factory AuthenticationViewState({
    required final GlobalKey<FormState> formKey,
    required final TextEditingController emailController,
    required final TextEditingController passwordController,

    // flags
   @Default(false) final bool isLoading,
   @Default(false) final bool isSigningOut,
   @Default(false) final bool isSuccess,
   final String? errorMessage,
  }) = _AuthenticationViewState;
}
