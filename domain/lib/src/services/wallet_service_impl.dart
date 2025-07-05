import 'dart:async';
import 'dart:convert';

import 'package:rxdart/rxdart.dart';

import '../../domain.dart';
import '../entities/wallet_entity.dart';

class WalletServiceImpl extends WalletService {
  WalletServiceImpl({
    required final LocalStorageService localStorageService,
    required final WalletRepository walletRepository,
  }) : _localStorageService = localStorageService,
       _walletRepository = walletRepository {
    unawaited(_initWallet());
  }

  final LocalStorageService _localStorageService;
  final WalletRepository _walletRepository;

  final BehaviorSubject<WalletEntity?> _walletController =
      BehaviorSubject.seeded(null);

  Future<void> _initWallet() async {
    final wallet = await _localStorageService.get('wallet');

    if (wallet == null) {
      return;
    }

    final walletEntity = jsonDecode(wallet);

    if (walletEntity is! Map<String, dynamic>) {
      return;
    }

    _walletController.add(WalletEntity.fromJson(walletEntity));
  }

  @override
  Stream<WalletEntity?> get wallet => _walletController.stream;

  @override
  WalletEntity? get walletvalue => _walletController.value;

  @override
  Future<Result<void>> sendMoney({
    required final double amount,
    required final String recipient,
  }) async {
    final wallet = walletvalue;

    if (wallet == null) {
      return UnknownFailure(
        message: 'Wallet not found',
        onRetry: () => sendMoney(amount: amount, recipient: recipient),
        stackTrace: StackTrace.current,
      );
    }

    if (amount > wallet.balance) {
      return UnknownFailure(
        message: 'Insufficient balance',
        onRetry: () => sendMoney(amount: amount, recipient: recipient),
        stackTrace: StackTrace.current,
      );
    }

    final result = await _walletRepository.sendMoney(
      amount: amount,
      recipient: recipient.replaceAll('-', ''),
    );

    switch (result) {
      case Success():
        {
          await _localStorageService.save(
            'wallet',
            value: jsonEncode(
              wallet.copyWith(balance: wallet.balance - amount).toJson(),
            ),
          );

          final transaction = TransactionEntity(
            amount: amount,
            recipient: recipient,
            date: DateTime.now().toIso8601String(),
          );

          final transactions = await getTransactions();

          await _localStorageService.save(
            'transactions',
            value: jsonEncode([
              ...transactions.map((final transaction) => transaction.toJson()),
              transaction.toJson(),
            ]),
          );

          _walletController.add(
            wallet.copyWith(balance: wallet.balance - amount),
          );

          return Success(
            null,
            onRetry: () => sendMoney(amount: amount, recipient: recipient),
          );
        }
      case Failure():
        return result;
    }
  }

  @override
  Future<List<TransactionEntity>> getTransactions() async {
    final transactions = await _localStorageService.get('transactions');

    if (transactions == null) {
      return [];
    }

    final transactionsEntity = jsonDecode(transactions);

    if (transactionsEntity is! List) {
      return [];
    }

    return transactionsEntity
        .map(
          (final transaction) => transaction is Map<String, dynamic>
              ? TransactionEntity.fromJson(transaction)
              : null,
        )
        .whereType<TransactionEntity>()
        .toList();
  }

  @override
  Future<void> dispose() async {
    await _walletController.close();
  }
}
