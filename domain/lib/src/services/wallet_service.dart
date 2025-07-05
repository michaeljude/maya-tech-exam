import '../entities/wallet_entity.dart';

abstract class WalletService {
  Future<WalletEntity?> getWallet();
}
