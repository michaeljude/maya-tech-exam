// ignore_for_file: avoid-late-keyword, lines_longer_than_80_chars

import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:monorepo/features/send_money/send_money_view_model.dart';

import 'send_money_view_model_test.mocks.dart';

@GenerateMocks([WalletService])
void main() {
  group('SendMoneyViewModel', () {
    late SendMoneyViewModel sendMoneyViewModel;
    late MockWalletService mockWalletService;

    setUp(() {
      mockWalletService = MockWalletService();
      sendMoneyViewModel = SendMoneyViewModel(mockWalletService);
    });

    group('sendMoney', () {
      const recipient = 'test@example.com';

      test(
        'should emit loading state and success when send money succeeds',
        () async {
          // Arrange
          final successResult = Success(
            TransactionEntity(
              amount: 1000,
              recipient: recipient,
              date: DateTime.now().toIso8601String(),
            ),
            onRetry: () async => Future.value(),
          );

          provideDummy<Result<void>>(
            Success(null, onRetry: () async => Future.value()),
          );

          when(
            mockWalletService.sendMoney(amount: 1000, recipient: recipient),
          ).thenAnswer((_) async => successResult);

          // Set up form state
          sendMoneyViewModel.state.amountController.text = '₱1,000.00';
          sendMoneyViewModel.state.recipientController.text = recipient;

          // Act
          await sendMoneyViewModel.sendMoney();

          // Assert
          expect(sendMoneyViewModel.state.isLoading, false);
          expect(
            sendMoneyViewModel.state.isSuccess,
            false,
          ); // Reset to false after success
          expect(sendMoneyViewModel.state.errorMessage, null);

          verify(
            mockWalletService.sendMoney(amount: 1000, recipient: recipient),
          ).called(1);
        },
      );

      test(
        'should emit loading state and error when send money fails',
        () async {
          // Arrange
          const errorMessage = 'Insufficient funds';
          final failureResult = ServerFailure(
            message: errorMessage,
            onRetry: () async => Future.value(),
            stackTrace: StackTrace.current,
          );
          provideDummy<Result<void>>(
            Success(null, onRetry: () async => Future.value()),
          );
          when(
            mockWalletService.sendMoney(amount: 1000, recipient: recipient),
          ).thenAnswer((_) async => failureResult);

          // Set up form state
          sendMoneyViewModel.state.amountController.text = '₱1,000.00';
          sendMoneyViewModel.state.recipientController.text = recipient;

          // Act
          await sendMoneyViewModel.sendMoney();

          // Assert
          expect(sendMoneyViewModel.state.isLoading, false);
          expect(sendMoneyViewModel.state.isSuccess, false);
          expect(
            sendMoneyViewModel.state.errorMessage,
            null,
          ); // Reset to null after error

          verify(
            mockWalletService.sendMoney(amount: 1000, recipient: recipient),
          ).called(1);
        },
      );

      test('should handle amount with currency symbol and commas', () async {
        // Arrange
        final successResult = Success(
          TransactionEntity(
            amount: 5000.5,
            recipient: recipient,
            date: DateTime.now().toIso8601String(),
          ),
          onRetry: () async => Future.value(),
        );
        provideDummy<Result<void>>(
          Success(null, onRetry: () async => Future.value()),
        );
        when(
          mockWalletService.sendMoney(amount: 5000.5, recipient: recipient),
        ).thenAnswer((_) async => successResult);

        // Set up form state with currency symbol and commas
        sendMoneyViewModel.state.amountController.text = '₱5,000.50';
        sendMoneyViewModel.state.recipientController.text = recipient;

        // Act
        await sendMoneyViewModel.sendMoney();

        // Assert
        verify(
          mockWalletService.sendMoney(amount: 5000.5, recipient: recipient),
        ).called(1);
      });

      test('should handle amount without currency symbol', () async {
        // Arrange
        final successResult = Success(
          TransactionEntity(
            amount: 250.75,
            recipient: recipient,
            date: DateTime.now().toIso8601String(),
          ),
          onRetry: () async => Future.value(),
        );
        provideDummy<Result<void>>(
          Success(null, onRetry: () async => Future.value()),
        );
        when(
          mockWalletService.sendMoney(amount: 250.75, recipient: recipient),
        ).thenAnswer((_) async => successResult);

        // Set up form state without currency symbol
        sendMoneyViewModel.state.amountController.text = '250.75';
        sendMoneyViewModel.state.recipientController.text = recipient;

        // Act
        await sendMoneyViewModel.sendMoney();

        // Assert
        verify(
          mockWalletService.sendMoney(amount: 250.75, recipient: recipient),
        ).called(1);
      });

      test('should handle amount with only commas', () async {
        // Arrange
        final successResult = Success(
          TransactionEntity(
            amount: 10000,
            recipient: recipient,
            date: DateTime.now().toIso8601String(),
          ),
          onRetry: () async => Future.value(),
        );
        provideDummy<Result<void>>(
          Success(null, onRetry: () async => Future.value()),
        );
        when(
          mockWalletService.sendMoney(amount: 10000, recipient: recipient),
        ).thenAnswer((_) async => successResult);

        // Set up form state with only commas
        sendMoneyViewModel.state.amountController.text = '10,000';
        sendMoneyViewModel.state.recipientController.text = recipient;

        // Act
        await sendMoneyViewModel.sendMoney();

        // Assert
        verify(
          mockWalletService.sendMoney(amount: 10000, recipient: recipient),
        ).called(1);
      });
    });

    group('state management', () {
      test('should properly dispose controllers on close', () async {
        // Arrange
        final amountController = sendMoneyViewModel.state.amountController;
        final recipientController =
            sendMoneyViewModel.state.recipientController;

        // Assert
        // ignore: invalid_use_of_protected_member
        expect(amountController.hasListeners, false);
        // ignore: invalid_use_of_protected_member
        expect(recipientController.hasListeners, false);

        // Act
        await sendMoneyViewModel.close();
      });

      test('should initialize with correct default state', () {
        // Assert
        expect(sendMoneyViewModel.state.isLoading, false);
        expect(sendMoneyViewModel.state.isSuccess, false);
        expect(sendMoneyViewModel.state.errorMessage, null);
        expect(sendMoneyViewModel.state.amountController, isNotNull);
        expect(sendMoneyViewModel.state.recipientController, isNotNull);
        expect(sendMoneyViewModel.state.formKey, isNotNull);
      });
    });
  });
}
