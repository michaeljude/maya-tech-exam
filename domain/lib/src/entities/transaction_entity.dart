import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_entity.freezed.dart';
part 'transaction_entity.g.dart';

@freezed
abstract class TransactionEntity with _$TransactionEntity {
  factory TransactionEntity({
    required final double amount,
    required final String recipient,
    required final String date,
  }) = _TransactionEntity;

  factory TransactionEntity.fromJson(final Map<String, dynamic> json) =>
      _$TransactionEntityFromJson(json);
}
