// ignore_for_file: avoid-late-keyword

import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:domain/src/entities/wallet_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'wallet_service_test.mocks.dart';

@GenerateMocks([LocalStorageService, WalletRepository, AuthenticationService])
void main() {
  group('WalletServiceImpl', () {
    late WalletServiceImpl walletService;
    late MockLocalStorageService mockLocalStorageService;
    late MockWalletRepository mockWalletRepository;
    late MockAuthenticationService mockAuthenticationService;

    setUpAll(() {
      mockLocalStorageService = MockLocalStorageService();
      mockWalletRepository = MockWalletRepository();
      mockAuthenticationService = MockAuthenticationService();
    });

    tearDown(() async {
      await walletService.dispose();
    });

    group('wallet stream', () {
      test(
        'should emit wallet when initialized with valid wallet data',
        () async {
          // Arrange
          const email = 'test@example.com';
          const username = 'Test User';
          final wallet = WalletEntity(name: username, balance: 1000);
          final walletJson = jsonEncode(wallet.toJson());

          when(
            mockAuthenticationService.getEmail(),
          ).thenAnswer((_) async => email);
          when(
            mockAuthenticationService.getUsername(),
          ).thenAnswer((_) async => username);
          when(
            mockLocalStorageService.get('${email}_wallet'),
          ).thenAnswer((_) async => walletJson);

          // Act
          walletService = WalletServiceImpl(
            localStorageService: mockLocalStorageService,
            walletRepository: mockWalletRepository,
            authenticationService: mockAuthenticationService,
          );

          // Assert - Test that stream emits the wallet
          await expectLater(walletService.wallet, emitsInOrder([null, wallet]));
        },
      );

      test(
        'should emit wallet when no wallet data exists and creates new wallet',
        () async {
          // Arrange
          const email = 'test@example.com';
          const username = 'Test User';

          provideDummy<Result<void>>(
            Success(null, onRetry: () async => Future.value()),
          );
          when(
            mockAuthenticationService.getEmail(),
          ).thenAnswer((_) async => email);
          when(
            mockAuthenticationService.getUsername(),
          ).thenAnswer((_) async => username);
          when(
            mockLocalStorageService.get('${email}_wallet'),
          ).thenAnswer((_) async => null);
          when(
            mockLocalStorageService.save(any, value: anyNamed('value')),
          ).thenAnswer(
            (_) async => Success(null, onRetry: () async => Future.value()),
          );

          // Act
          walletService = WalletServiceImpl(
            localStorageService: mockLocalStorageService,
            walletRepository: mockWalletRepository,
            authenticationService: mockAuthenticationService,
          );

          // Assert - Test that stream emits a wallet entity
          await expectLater(
            walletService.wallet,
            emitsInOrder([null, isA<WalletEntity>()]),
          );

          // Verify the wallet was saved
          verify(
            mockLocalStorageService.save(
              '${email}_wallet',
              value: anyNamed('value'),
            ),
          ).called(1);
        },
      );

      test(
        'should emit wallet when no wallet data exists and username is null',
        () async {
          // Arrange
          const email = 'test@example.com';

          provideDummy<Result<void>>(
            Success(null, onRetry: () async => Future.value()),
          );
          when(
            mockAuthenticationService.getEmail(),
          ).thenAnswer((_) async => email);
          when(
            mockAuthenticationService.getUsername(),
          ).thenAnswer((_) async => null);
          when(
            mockLocalStorageService.get('${email}_wallet'),
          ).thenAnswer((_) async => null);
          when(
            mockLocalStorageService.save(any, value: anyNamed('value')),
          ).thenAnswer(
            (_) async => Success(null, onRetry: () async => Future.value()),
          );

          // Act
          walletService = WalletServiceImpl(
            localStorageService: mockLocalStorageService,
            walletRepository: mockWalletRepository,
            authenticationService: mockAuthenticationService,
          );

          // Assert - Test that stream emits a wallet with default name 'there'
          await expectLater(
            walletService.wallet,
            emitsInOrder([
              null,
              predicate<WalletEntity>((final wallet) => wallet.name == 'there'),
            ]),
          );
        },
      );

      test('should emit null when wallet data is invalid JSON', () async {
        // Arrange
        const email = 'test@example.com';
        const username = 'Test User';

        when(
          mockAuthenticationService.getEmail(),
        ).thenAnswer((_) async => email);
        when(
          mockAuthenticationService.getUsername(),
        ).thenAnswer((_) async => username);
        when(
          mockLocalStorageService.get('${email}_wallet'),
        ).thenAnswer((_) async => 'invalid json');

        // Act
        walletService = WalletServiceImpl(
          localStorageService: mockLocalStorageService,
          walletRepository: mockWalletRepository,
          authenticationService: mockAuthenticationService,
        );

        // Assert - Test that stream emits null for invalid JSON
        await expectLater(walletService.wallet, emits(null));
      });
    });

    group('sendMoney', () {
      test('should return failure when wallet is null', () async {
        // Arrange
        const email = 'test@example.com';
        const username = 'Test User';
        const amount = 100.0;
        const recipient = 'test-recipient';
        final wallet = WalletEntity(name: username, balance: 1000);
        final walletJson = jsonEncode(wallet.toJson());

        when(
          mockAuthenticationService.getEmail(),
        ).thenAnswer((_) async => email);
        when(
          mockAuthenticationService.getUsername(),
        ).thenAnswer((_) async => username);
        when(
          mockLocalStorageService.get('${email}_wallet'),
        ).thenAnswer((_) async => walletJson);

        // Create service without initializing wallet
        walletService = WalletServiceImpl(
          localStorageService: mockLocalStorageService,
          walletRepository: mockWalletRepository,
          authenticationService: mockAuthenticationService,
        );

        // Act
        final result = await walletService.sendMoney(
          amount: amount,
          recipient: recipient,
        );

        // Assert
        expect(result, isA<UnknownFailure>());
        expect((result as UnknownFailure).message, 'Wallet not found');
      });

      test('should return failure when insufficient balance', () async {
        // Arrange
        const amount = 2000.0;
        const recipient = 'test-recipient';
        const email = 'test@example.com';
        const username = 'Test User';
        final wallet = WalletEntity(name: username, balance: 1000);

        when(
          mockAuthenticationService.getEmail(),
        ).thenAnswer((_) async => email);
        when(
          mockAuthenticationService.getUsername(),
        ).thenAnswer((_) async => username);
        when(
          mockLocalStorageService.get('${email}_wallet'),
        ).thenAnswer((_) async => jsonEncode(wallet.toJson()));

        walletService = WalletServiceImpl(
          localStorageService: mockLocalStorageService,
          walletRepository: mockWalletRepository,
          authenticationService: mockAuthenticationService,
        );

        // Wait for wallet to be instantiated
        await Future<void>.delayed(Duration.zero);
        await walletService.wallet.first;

        // Act
        final result = await walletService.sendMoney(
          amount: amount,
          recipient: recipient,
        );

        // Assert
        expect(result, isA<UnknownFailure>());
        expect((result as UnknownFailure).message, 'Insufficient balance');
      });

      test('should return failure when repository fails', () async {
        // Arrange
        const amount = 100.0;
        const recipient = 'test-recipient';
        const email = 'test@example.com';
        const username = 'Test User';
        final wallet = WalletEntity(name: username, balance: 1000);

        provideDummy<Result<void>>(
          Success(null, onRetry: () async => Future.value()),
        );
        when(
          mockAuthenticationService.getEmail(),
        ).thenAnswer((_) async => email);
        when(
          mockAuthenticationService.getUsername(),
        ).thenAnswer((_) async => username);
        when(
          mockLocalStorageService.get('${email}_wallet'),
        ).thenAnswer((_) async => jsonEncode(wallet.toJson()));

        final failureResult = ServerFailure(
          message: 'Server error',
          onRetry: () async => Future.value(),
          stackTrace: StackTrace.current,
        );

        when(
          mockWalletRepository.sendMoney(
            amount: amount,
            recipient: recipient.replaceAll('-', ''),
          ),
        ).thenAnswer((_) async => failureResult);

        walletService = WalletServiceImpl(
          localStorageService: mockLocalStorageService,
          walletRepository: mockWalletRepository,
          authenticationService: mockAuthenticationService,
        );

        // Wait for wallet to be instantiated
        await Future<void>.delayed(Duration.zero);
        await walletService.wallet.first;

        // Act
        final result = await walletService.sendMoney(
          amount: amount,
          recipient: recipient,
        );

        // Assert
        expect(result, isA<ServerFailure>());
      });

      test(
        'should return success and update wallet when send money succeeds',
        () async {
          // Arrange
          const amount = 100.0;
          const recipient = 'test-recipient';
          const email = 'test@example.com';
          const username = 'Test User';
          final wallet = WalletEntity(name: username, balance: 1000);
          final updatedWallet = wallet.copyWith(
            balance: wallet.balance - amount,
          );

          provideDummy<Result<void>>(
            Success(null, onRetry: () async => Future.value()),
          );
          when(
            mockAuthenticationService.getEmail(),
          ).thenAnswer((_) async => email);
          when(
            mockAuthenticationService.getUsername(),
          ).thenAnswer((_) async => username);
          when(
            mockLocalStorageService.get('${email}_wallet'),
          ).thenAnswer((_) async => jsonEncode(wallet.toJson()));

          when(
            mockLocalStorageService.get('${email}_transactions'),
          ).thenAnswer((_) async => null);

          when(
            mockLocalStorageService.save(any, value: anyNamed('value')),
          ).thenAnswer(
            (_) async => Success(null, onRetry: () async => Future.value()),
          );

          when(
            mockWalletRepository.sendMoney(
              amount: amount,
              recipient: recipient.replaceAll('-', ''),
            ),
          ).thenAnswer(
            (_) async => Success(null, onRetry: () async => Future.value()),
          );

          walletService = WalletServiceImpl(
            localStorageService: mockLocalStorageService,
            walletRepository: mockWalletRepository,
            authenticationService: mockAuthenticationService,
          );

          // Wait for wallet to be initialized
          await Future<void>.delayed(Duration.zero);
          await walletService.wallet.first;

          // Act
          final result = await walletService.sendMoney(
            amount: amount,
            recipient: recipient,
          );

          // Assert
          expect(result, isA<Success<void>>());

          // Verify wallet was updated in storage
          verify(
            mockLocalStorageService.save(
              '${email}_wallet',
              value: jsonEncode(updatedWallet.toJson()),
            ),
          ).called(1);

          // Verify transaction was saved
          verify(
            mockLocalStorageService.save(
              '${email}_transactions',
              value: anyNamed('value'),
            ),
          ).called(1);

          // Verify wallet stream was updated
          expect(walletService.walletvalue, equals(updatedWallet));
        },
      );
    });

    group('getTransactions', () {
      test('should return empty list when no transactions exist', () async {
        // Arrange
        const email = 'test@example.com';
        const username = 'Test User';

        final wallet = WalletEntity(name: username, balance: 1000);
        final walletJson = jsonEncode(wallet.toJson());

        provideDummy<Result<void>>(
          Success(null, onRetry: () async => Future.value()),
        );
        when(
          mockAuthenticationService.getEmail(),
        ).thenAnswer((_) async => email);
        when(
          mockAuthenticationService.getUsername(),
        ).thenAnswer((_) async => username);
        when(
          mockLocalStorageService.get('${email}_wallet'),
        ).thenAnswer((_) async => walletJson);
        when(
          mockLocalStorageService.get('${email}_transactions'),
        ).thenAnswer((_) async => null);

        walletService = WalletServiceImpl(
          localStorageService: mockLocalStorageService,
          walletRepository: mockWalletRepository,
          authenticationService: mockAuthenticationService,
        );

        // Act
        await Future<void>.delayed(Duration.zero);
        final result = await walletService.getTransactions();

        // Assert
        expect(result, isEmpty);
      });

      test('should return transactions when valid data exists', () async {
        // Arrange
        const email = 'test@example.com';
        const username = 'Test User';

        final wallet = WalletEntity(name: username, balance: 1000);
        final walletJson = jsonEncode(wallet.toJson());

        final transactions = [
          TransactionEntity(
            amount: 100,
            recipient: 'test-recipient',
            date: DateTime.now().toIso8601String(),
          ),
        ];

        final transactionsJson = jsonEncode(
          transactions.map((final t) => t.toJson()).toList(),
        );

        when(
          mockAuthenticationService.getEmail(),
        ).thenAnswer((_) async => email);
        when(
          mockAuthenticationService.getUsername(),
        ).thenAnswer((_) async => username);
        when(
          mockLocalStorageService.get('${email}_wallet'),
        ).thenAnswer((_) async => walletJson);
        when(
          mockLocalStorageService.get('${email}_transactions'),
        ).thenAnswer((_) async => transactionsJson);

        walletService = WalletServiceImpl(
          localStorageService: mockLocalStorageService,
          walletRepository: mockWalletRepository,
          authenticationService: mockAuthenticationService,
        );

        // Act
        final result = await walletService.getTransactions();

        // Assert
        expect(result, hasLength(1));
        expect(result.first.amount, transactions.first.amount);
        expect(result.first.recipient, transactions.first.recipient);
      });

      test(
        'should return empty list when transactions data is invalid JSON',
        () async {
          // Arrange
          const email = 'test@example.com';
          const username = 'Test User';

          final wallet = WalletEntity(name: username, balance: 1000);
          final walletJson = jsonEncode(wallet.toJson());

          when(
            mockAuthenticationService.getEmail(),
          ).thenAnswer((_) async => email);
          when(
            mockAuthenticationService.getUsername(),
          ).thenAnswer((_) async => username);
          when(
            mockLocalStorageService.get('${email}_wallet'),
          ).thenAnswer((_) async => walletJson);
          when(
            mockLocalStorageService.get('${email}_transactions'),
          ).thenAnswer((_) async => 'invalid json');

          walletService = WalletServiceImpl(
            localStorageService: mockLocalStorageService,
            walletRepository: mockWalletRepository,
            authenticationService: mockAuthenticationService,
          );

          // Act
          final result = await walletService.getTransactions();

          // Assert
          expect(result, isEmpty);
        },
      );

      test(
        'should return empty list when transactions data is not a list',
        () async {
          // Arrange
          const email = 'test@example.com';
          const username = 'Test User';

          final wallet = WalletEntity(name: username, balance: 1000);
          final walletJson = jsonEncode(wallet.toJson());

          when(
            mockAuthenticationService.getEmail(),
          ).thenAnswer((_) async => email);
          when(
            mockAuthenticationService.getUsername(),
          ).thenAnswer((_) async => username);
          when(
            mockLocalStorageService.get('${email}_wallet'),
          ).thenAnswer((_) async => walletJson);
          when(
            mockLocalStorageService.get('${email}_transactions'),
          ).thenAnswer((_) async => jsonEncode({'not': 'a list'}));

          walletService = WalletServiceImpl(
            localStorageService: mockLocalStorageService,
            walletRepository: mockWalletRepository,
            authenticationService: mockAuthenticationService,
          );

          // Act
          final result = await walletService.getTransactions();

          // Assert
          expect(result, isEmpty);
        },
      );
    });
  });
}
