// ignore_for_file: avoid-late-keyword, lines_longer_than_80_chars

import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:monorepo/features/transactions/transactions_view_model.dart';

import 'transactions_view_model_test.mocks.dart';

@GenerateMocks([WalletService])
void main() {
  group('TransactionsViewModel', () {
    late MockWalletService mockWalletService;

    setUp(() {
      mockWalletService = MockWalletService();
    });

    test(
      'should call getTransactions on initialization and update state',
      () async {
        // Arrange
        final transactions = [
          TransactionEntity(
            amount: 100,
            recipient: 'alice',
            date: '2024-06-01',
          ),
          TransactionEntity(amount: 200, recipient: 'bob', date: '2024-06-02'),
        ];
        when(
          mockWalletService.getTransactions(),
        ).thenAnswer((_) async => transactions);

        // Act
        final viewModel = TransactionsViewModel(mockWalletService);
        // Wait for async constructor call
        await Future<void>.delayed(Duration.zero);

        // Assert
        expect(viewModel.state.transactions, transactions);
        verify(mockWalletService.getTransactions()).called(1);
      },
    );

    test('getTransactions updates state with new transactions', () async {
      // Arrange
      final transactions = [
        TransactionEntity(amount: 300, recipient: 'carol', date: '2024-06-03'),
      ];
      when(
        mockWalletService.getTransactions(),
      ).thenAnswer((_) async => transactions);

      final viewModel = TransactionsViewModel(mockWalletService);
      await Future<void>.delayed(Duration.zero);

      // Act
      await viewModel.getTransactions();

      // Assert
      expect(viewModel.state.transactions, transactions);
      verify(
        mockWalletService.getTransactions(),
      ).called(greaterThanOrEqualTo(1));
    });

    test('initial state has empty transactions', () {
      // Arrange
      when(mockWalletService.getTransactions()).thenAnswer((_) async => []);

      // Act
      final viewModel = TransactionsViewModel(mockWalletService);

      // Assert
      expect(viewModel.state.transactions, isEmpty);
    });
  });
}
