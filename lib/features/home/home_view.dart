import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../router/app_router.gr.dart';
import '../authentication/authentication_view_model.dart';
import 'home_view_model.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(final BuildContext context) => MayaScaffold(
    onLogout: () async {
      await context.read<AuthenticationViewModel>().signOut();
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
                const Text(
                  'Wallet Balance',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                  text: 'Send Money',
                  onPressed: () async {
                    await context.router.push(const SendMoneyRoute());
                  },
                ),
                const SizedBox(height: 16),
                MayaButton(
                  text: 'View Transactions',
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
