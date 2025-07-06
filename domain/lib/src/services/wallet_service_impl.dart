import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain.dart';

class WalletServiceImpl extends WalletService {
  WalletServiceImpl({
    required final LocalStorageService localStorageService,
    required final WalletRepository walletRepository,
    required final AuthenticationService authenticationService,
  }) : _localStorageService = localStorageService,
       _walletRepository = walletRepository,
       _authenticationService = authenticationService {
    unawaited(initWallet());
  }

  final LocalStorageService _localStorageService;
  final WalletRepository _walletRepository;
  final AuthenticationService _authenticationService;

  final BehaviorSubject<WalletEntity?> _walletController =
      BehaviorSubject.seeded(null);

  @override
  Future<void> initWallet() async {
    final email = await _authenticationService.getEmail();
    final username = await _authenticationService.getUsername();
    final wallet = await _localStorageService.get('${email}_wallet');

    if (wallet == null) {
      final walletEntity = WalletEntity(
        name: username ?? 'there',
        balance: 10000,
      );

      await _localStorageService.save(
        '${email}_wallet',
        value: jsonEncode(walletEntity.toJson()),
      );

      _walletController.add(WalletEntity.fromJson(walletEntity.toJson()));

      return;
    }

    try {
      final walletEntity = jsonDecode(wallet);

      if (walletEntity is! Map<String, dynamic>) {
        return;
      }

      _walletController.add(WalletEntity.fromJson(walletEntity));
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Stream<WalletEntity?> get wallet => _walletController.stream;

  @override
  WalletEntity? get walletvalue => _walletController.value;

  @override
  void clearWallet() {
    _walletController.add(null);
  }

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
          final email = await _authenticationService.getEmail();
          await _localStorageService.save(
            '${email}_wallet',
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
            '${email}_transactions',
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
    final email = await _authenticationService.getEmail();
    final transactions = await _localStorageService.get(
      '${email}_transactions',
    );

    if (transactions == null) {
      return [];
    }

    try {
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
    } catch (error) {
      debugPrint(error.toString());
    }

    return [];
  }

  @override
  Future<void> dispose() async {
    await _walletController.close();
  }
}
