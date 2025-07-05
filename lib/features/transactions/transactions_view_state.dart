import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transactions_view_state.freezed.dart';

@freezed
abstract class TransactionsViewState with _$TransactionsViewState {
  factory TransactionsViewState({
    @Default([]) final List<TransactionEntity> transactions,
  }) = _TransactionsViewState;
}
