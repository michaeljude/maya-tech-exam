import '../../domain.dart';

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
