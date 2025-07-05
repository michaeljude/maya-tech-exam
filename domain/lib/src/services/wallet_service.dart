import '../../domain.dart';
import '../entities/wallet_entity.dart';

abstract class WalletService {
  Future<WalletEntity?> getWallet();

  Future<Result<void>> sendMoney({
    required final double amount,
    required final String recipient,
  });

  Future<List<TransactionEntity>> getTransactions();
}
