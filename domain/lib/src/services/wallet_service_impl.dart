import 'dart:convert';

import '../../domain.dart';
import '../entities/wallet_entity.dart';

class WalletServiceImpl extends WalletService {
  WalletServiceImpl({required final LocalStorageService localStorageService})
    : _localStorageService = localStorageService;

  final LocalStorageService _localStorageService;

  @override
  Future<WalletEntity?> getWallet() async {
    final wallet = await _localStorageService.get('wallet');

    if (wallet == null) {
      return null;
    }

    final walletEntity = jsonDecode(wallet);

    if (walletEntity is! Map<String, dynamic>) {
      return null;
    }

    return WalletEntity.fromJson(walletEntity);
  }
}
