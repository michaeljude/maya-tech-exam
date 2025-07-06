import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/extension/context_extension.dart';
import '../../router/app_router.gr.dart';
import '../authentication/authentication_view_model.dart';
import 'send_money_view_model.dart';
import 'send_money_view_state.dart';

@RoutePage()
class SendMoneyView extends StatelessWidget {
  const SendMoneyView({super.key});

  @override
  Widget build(final BuildContext context) => BlocProvider(
    create: (final context) =>
        SendMoneyViewModel(context.read<WalletService>()),
    child: BlocListener<SendMoneyViewModel, SendMoneyViewState>(
      listener: (final context, final state) async {
        final isSuccess = state.isSuccess;
        final errorMessage = state.errorMessage;

        if (isSuccess) {
          await showModalBottomSheet<void>(
            context: context,
            builder: (final context) => _MayaBottomSheet(
              message: context.intl.moneySentSuccessfully,
              isSuccess: true,
            ),
          );
          if (context.mounted) {
            context.router.pop();
          }
        } else if (errorMessage != null) {
          await showModalBottomSheet<void>(
            context: context,
            builder: (final context) =>
                _MayaBottomSheet(message: errorMessage, isSuccess: false),
          );
        }
      },
      child: Builder(
        builder: (final context) => MayaScaffold(
          onLogout: () async {
            await context.read<AuthenticationViewModel>().signOut(
              onSuccess: () async {
                if (context.mounted) {
                  context.read<WalletService>().clearWallet();
                }

                await context.router.replaceAll([const HomeRoute()]);
              },
              onFailure: () async {
                await showModalBottomSheet<void>(
                  context: context,
                  builder: (final context) => const _MayaBottomSheet(
                    message: 'Sign out failed',
                    isSuccess: false,
                  ),
                );
              },
            );

            if (context.mounted) {
              context.read<WalletService>().clearWallet();
            }
          },
          isSigningOut: context.select<AuthenticationViewModel, bool>(
            (final vm) => vm.state.isSigningOut,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: context.select<SendMoneyViewModel, GlobalKey<FormState>>(
                (final vm) => vm.state.formKey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    context.intl.sendMoney,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  MayaMobileNumberTextField(
                    labelText: context.intl.recipientPhone,
                    controller: context
                        .select<SendMoneyViewModel, TextEditingController>(
                          (final vm) => vm.state.recipientController,
                        ),
                    validator: (final value) {
                      if (value == null || value.isEmpty) {
                        return context.intl.pleaseEnterRecipientPhone;
                      }

                      final validFormats = [
                        RegExp(r'^\d{3}-\d{4}-\d{4}$'),
                        RegExp(r'^\d{3}-\d{3}-\d{4}$'),
                      ];

                      if (!validFormats.any(
                        (final format) => format.hasMatch(value),
                      )) {
                        return context.intl.pleaseEnterValidPhoneNumber;
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  MayaAmountTextField(
                    labelText: context.intl.amount,
                    controller: context
                        .select<SendMoneyViewModel, TextEditingController>(
                          (final vm) => vm.state.amountController,
                        ),
                    validator: (final value) {
                      if (value == null || value.isEmpty) {
                        return context.intl.pleaseEnterAmount;
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  MayaButton(
                    text: context.intl.sendMoney,
                    isLoading: context.select<SendMoneyViewModel, bool>(
                      (final vm) => vm.state.isLoading,
                    ),
                    onPressed: () async {
                      if (context.mounted) {
                        final currentState = context
                            .read<SendMoneyViewModel>()
                            .state
                            .formKey
                            .currentState;
                        if (currentState != null && currentState.validate()) {
                          await context.read<SendMoneyViewModel>().sendMoney();
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class _MayaBottomSheet extends StatelessWidget {
  const _MayaBottomSheet({required this.message, required this.isSuccess});

  final String message;
  final bool isSuccess;

  @override
  Widget build(final BuildContext context) => Scaffold(
    body: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isSuccess)
            const Icon(Icons.check_circle, color: Colors.green, size: 48)
          else
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    ),
  );
}
