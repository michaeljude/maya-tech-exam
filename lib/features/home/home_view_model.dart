import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/extension/cubit_extension.dart';
import 'home_view_state.dart';

class HomeViewModel extends Cubit<HomeViewState> {
  HomeViewModel({required final WalletService walletService})
    : _walletService = walletService,
      super(const HomeViewState()) {
    unawaited(getWalletBalance());
  }

  final WalletService _walletService;

  Future<void> getWalletBalance() async {
    _walletService.wallet.listen((final wallet) {
      final balance = wallet?.balance;
      safeEmit(state.copyWith(balance: balance ?? 0, username: wallet?.name));
    });
  }

  void toggleBalanceVisibility() {
    safeEmit(state.copyWith(isBalanceHidden: !state.isBalanceHidden));
  }
}
