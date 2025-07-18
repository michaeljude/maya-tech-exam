import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/extension/context_extension.dart';
import '../../router/app_router.gr.dart';
import '../authentication/authentication_view_model.dart';
import 'home_view_model.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(final BuildContext context) => MayaScaffold(
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
    },
    isSigningOut: context.select<AuthenticationViewModel, bool>(
      (final vm) => vm.state.isSigningOut,
    ),
    body: BlocProvider(
      create: (final context) =>
          HomeViewModel(walletService: context.read<WalletService>()),
      child: Builder(
        builder: (final context) => Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 100),
                Text(
                  context.select<HomeViewModel, String>(
                    (final vm) => vm.state.welcomeText,
                  ),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  context.intl.walletBalance,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MayaCurrencyText(
                      value: context.select<HomeViewModel, double>(
                        (final vm) => vm.state.balance,
                      ),
                      isBalanceHidden: context.select<HomeViewModel, bool>(
                        (final vm) => vm.state.isBalanceHidden,
                      ),
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: Icon(
                        context.select<HomeViewModel, IconData>(
                          (final vm) => vm.state.isBalanceHidden
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      onPressed: () {
                        context.read<HomeViewModel>().toggleBalanceVisibility();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 86),
                MayaButton(
                  text: context.intl.sendMoney,
                  onPressed: () async {
                    await context.router.push(const SendMoneyRoute());
                  },
                ),
                const SizedBox(height: 16),
                MayaButton(
                  text: context.intl.viewTransactions,
                  onPressed: () async {
                    await context.router.push(const TransactionsRoute());
                  },
                ),
              ],
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
