import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/extension/context_extension.dart';
import '../../app/utils/bottom_sheet_helper.dart';
import '../authentication/authentication_view_model.dart';
import '../authentication/authentication_view_state.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  const LoginView({super.key, this.onResult});

  final void Function({required bool isSuccessLogin})? onResult;

  @override
  Widget build(
    final BuildContext context,
  ) => BlocListener<AuthenticationViewModel, AuthenticationViewState>(
    listener: (final context, final state) async {
      final errorMessage = state.errorMessage;
      final isSuccess = state.isSuccess;

      if (isSuccess) {
        onResult?.call(isSuccessLogin: true);
      } else if (errorMessage != null) {
        await BottomSheetHelper.showBottomSheet<void>(
          context,
          _MayaErrorBottomSheet(errorMessage: errorMessage),
        );
      }
    },
    child: Builder(
      builder: (final context) {
        final formKey = context
            .select<AuthenticationViewModel, GlobalKey<FormState>?>(
              (final vm) => vm.state.formKey,
            );
        final emailController = context
            .select<AuthenticationViewModel, TextEditingController>(
              (final vm) => vm.state.emailController,
            );
        final passwordController = context
            .select<AuthenticationViewModel, TextEditingController>(
              (final vm) => vm.state.passwordController,
            );

        return MayaScaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    context.intl.welcomeToMaya,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  MayaEmailField(
                    controller: emailController,
                    labelText: context.intl.email,
                    validator: (final value) {
                      if (value == null || value.isEmpty) {
                        return context.intl.pleaseEnterYourEmail;
                      }

                      final emailRegex = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                      );

                      if (!emailRegex.hasMatch(value)) {
                        return context.intl.pleaseEnterValidEmail;
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  MayaPasswordField(
                    controller: passwordController,
                    labelText: context.intl.password,
                    validator: (final value) {
                      if (value == null || value.isEmpty) {
                        return context.intl.pleaseEnterYourPassword;
                      }

                      if (value.length <= 5) {
                        return context.intl.passwordMustBeAtLeast6Characters;
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 84),
                  MayaButton(
                    text: context.intl.login,
                    onPressed: context.read<AuthenticationViewModel>().signIn,
                    isLoading: context.select<AuthenticationViewModel, bool>(
                      (final vm) => vm.state.isLoading,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

class _MayaErrorBottomSheet extends StatelessWidget {
  const _MayaErrorBottomSheet({required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(final BuildContext context) => Scaffold(
    body: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 48),
          const SizedBox(height: 16),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    ),
  );
}
