import '../result/result.dart';

abstract class WalletRepository {
  Future<Result<void>> sendMoney({
    required final double amount,
    required final String recipient,
  });
}
