import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_money_view_state.freezed.dart';

@freezed
abstract class SendMoneyViewState with _$SendMoneyViewState {
  factory SendMoneyViewState({
    required final GlobalKey<FormState> formKey,
    required final TextEditingController amountController,
    required final TextEditingController recipientController,
    @Default(false) final bool isLoading,
    @Default(false) final bool isSuccess,
    final String? errorMessage,
  }) = _SendMoneyViewState;
}
