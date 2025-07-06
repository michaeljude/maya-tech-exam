import '../../domain.dart';
import '../entities/wallet_entity.dart';

abstract class WalletService {
  Future<void> initWallet();

  Stream<WalletEntity?> get wallet;

  WalletEntity? walletvalue;

  Future<Result<void>> sendMoney({
    required final double amount,
    required final String recipient,
  });

  Future<List<TransactionEntity>> getTransactions();

  void clearWallet();

  Future<void> dispose();
}
