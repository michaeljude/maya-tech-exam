import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/extension/cubit_extension.dart';
import 'transactions_view_state.dart';

class TransactionsViewModel extends Cubit<TransactionsViewState> {
  TransactionsViewModel(this._walletService) : super(TransactionsViewState()) {
    unawaited(getTransactions());
  }

  final WalletService _walletService;

  Future<void> getTransactions() async {
    final transactions = await _walletService.getTransactions();
    safeEmit(state.copyWith(transactions: transactions));
  }
}
