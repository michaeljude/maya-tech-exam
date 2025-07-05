// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionEntity _$TransactionEntityFromJson(Map<String, dynamic> json) =>
    _TransactionEntity(
      amount: (json['amount'] as num).toDouble(),
      recipient: json['recipient'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$TransactionEntityToJson(_TransactionEntity instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'recipient': instance.recipient,
      'date': instance.date,
    };
