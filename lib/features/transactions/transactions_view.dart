import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/extension/context_extension.dart';
import '../../router/app_router.gr.dart';
import '../authentication/authentication_view_model.dart';
import 'transactions_view_model.dart';

@RoutePage()
class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(final BuildContext context) => BlocProvider(
    create: (final context) =>
        TransactionsViewModel(context.read<WalletService>()),
    child: MayaScaffold(
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
      body: Builder(
        builder: (final context) {
          final itemCount = context.select<TransactionsViewModel, int>(
            (final vm) => vm.state.transactions.length,
          );
          final transactions = context
              .select<TransactionsViewModel, List<TransactionEntity>>(
                (final vm) => vm.state.transactions,
              );

          if (itemCount == 0) {
            return Center(child: Text(context.intl.noTransactionsFound));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: itemCount,
            itemBuilder: (final context, final index) {
              final transaction = transactions[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.arrow_upward, color: Colors.white),
                  ),
                  title: Text(
                    context.intl.moneySent,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    context.intl.recipient(transaction.recipient),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      MayaDeductedAmountText(
                        value: transaction.amount,
                        color: Colors.red,
                      ),
                      MayaDateText(date: transaction.date),
                    ],
                  ),
                ),
              );
            },
          );
        },
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
