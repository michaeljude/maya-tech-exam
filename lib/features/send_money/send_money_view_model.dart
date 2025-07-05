import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/extension/cubit_extension.dart';
import 'send_money_view_state.dart';

class SendMoneyViewModel extends Cubit<SendMoneyViewState> {
  SendMoneyViewModel(this._walletService)
    : super(
        SendMoneyViewState(
          formKey: GlobalKey<FormState>(),
          amountController: TextEditingController(),
          recipientController: TextEditingController(),
        ),
      );

  final WalletService _walletService;

  Future<void> sendMoney() async {
    safeEmit(state.copyWith(isLoading: true));

    final amount = state.amountController.text
        .replaceAll('₱', '')
        .replaceAll(',', '');
    final recipient = state.recipientController.text;

    final result = await _walletService.sendMoney(
      amount: double.parse(amount),
      recipient: recipient,
    );

    switch (result) {
      case Success():
        safeEmit(state.copyWith(isLoading: false, isSuccess: true));
        safeEmit(state.copyWith(isSuccess: false));
      case Failure():
        safeEmit(
          state.copyWith(isLoading: false, errorMessage: result.message),
        );
        safeEmit(state.copyWith(errorMessage: null));
    }
  }

  @override
  Future<void> close() {
    state.amountController.dispose();
    state.recipientController.dispose();

    return super.close();
  }
}
