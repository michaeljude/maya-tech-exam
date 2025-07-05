// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WalletEntity _$WalletEntityFromJson(Map<String, dynamic> json) =>
    _WalletEntity(
      name: json['name'] as String,
      balance: (json['balance'] as num).toDouble(),
    );

Map<String, dynamic> _$WalletEntityToJson(_WalletEntity instance) =>
    <String, dynamic>{'name': instance.name, 'balance': instance.balance};
