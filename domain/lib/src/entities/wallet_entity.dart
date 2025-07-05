import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_entity.freezed.dart';
part 'wallet_entity.g.dart';

@freezed
abstract class WalletEntity with _$WalletEntity {
  factory WalletEntity({
    required final String name,
    required final double balance,
  }) = _WalletEntity;

  factory WalletEntity.fromJson(final Map<String, dynamic> json) =>
      _$WalletEntityFromJson(json);
}
