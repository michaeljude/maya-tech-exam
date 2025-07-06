// ignore_for_file: avoid-late-keyword, lines_longer_than_80_chars

import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:monorepo/features/home/home_view_model.dart';
import 'package:rxdart/rxdart.dart';

import 'home_view_model_test.mocks.dart';

@GenerateMocks([WalletService])
void main() {
  group('HomeViewModel', () {
    late HomeViewModel homeViewModel;
    late MockWalletService mockWalletService;
    late BehaviorSubject<WalletEntity?> walletStreamController;

    setUp(() {
      mockWalletService = MockWalletService();
      walletStreamController = BehaviorSubject.seeded(null);

      // Set up the wallet stream mock
      when(
        mockWalletService.wallet,
      ).thenAnswer((_) => walletStreamController.stream);

      homeViewModel = HomeViewModel(walletService: mockWalletService);
    });

    tearDown(() {
      unawaited(walletStreamController.close());
      unawaited(homeViewModel.close());
    });

    group('initialization', () {
      test('should call initWallet and getWalletBalance on creation', () async {
        // Arrange
        when(mockWalletService.initWallet()).thenAnswer(
          (_) async => Success(null, onRetry: () async => Future.value()),
        );

        // Act
        final viewModel = HomeViewModel(walletService: mockWalletService);

        // Wait for async initialization
        await Future<void>.delayed(Duration.zero);

        // Assert
        expect(viewModel, isNotNull);
        verify(mockWalletService.initWallet()).called(2);
        verify(mockWalletService.wallet).called(greaterThanOrEqualTo(1));
      });

      test('should initialize with default state', () {
        // Assert
        expect(homeViewModel.state.balance, 0);
        expect(homeViewModel.state.username, null);
        expect(homeViewModel.state.isBalanceHidden, true);
      });
    });

    group('getWalletBalance', () {
      test('should update state when wallet data is received', () async {
        // Arrange
        final wallet = WalletEntity(name: 'John Doe', balance: 1500);

        // Act
        walletStreamController.add(wallet);
        await Future<void>.delayed(Duration.zero);

        // Assert
        expect(homeViewModel.state.balance, 1500.0);
        expect(homeViewModel.state.username, 'John Doe');
      });

      test('should handle null wallet data', () async {
        // Arrange
        final wallet = WalletEntity(name: 'John Doe', balance: 1000);
        walletStreamController.add(wallet);
        await Future<void>.delayed(Duration.zero);

        // Act
        walletStreamController.add(null);
        await Future<void>.delayed(Duration.zero);

        // Assert
        expect(homeViewModel.state.balance, 0);
        expect(homeViewModel.state.username, null);
      });

      test('should handle multiple wallet updates', () async {
        // Arrange
        final wallet1 = WalletEntity(name: 'John Doe', balance: 1000);
        final wallet2 = WalletEntity(name: 'Jane Smith', balance: 2500);

        // Act
        walletStreamController.add(wallet1);
        await Future<void>.delayed(Duration.zero);

        walletStreamController.add(wallet2);
        await Future<void>.delayed(Duration.zero);

        // Assert
        expect(homeViewModel.state.balance, 2500.0);
        expect(homeViewModel.state.username, 'Jane Smith');
      });
    });

    group('toggleBalanceVisibility', () {
      test('should toggle balance visibility from hidden to visible', () {
        // Arrange
        expect(homeViewModel.state.isBalanceHidden, true);

        // Act
        homeViewModel.toggleBalanceVisibility();

        // Assert
        expect(homeViewModel.state.isBalanceHidden, false);
      });

      test('should toggle balance visibility from visible to hidden', () {
        // Arrange
        homeViewModel.toggleBalanceVisibility();
        expect(homeViewModel.state.isBalanceHidden, false);

        // Act
        homeViewModel.toggleBalanceVisibility();

        // Assert
        expect(homeViewModel.state.isBalanceHidden, true);
      });

      test(
        'should preserve other state when toggling balance visibility',
        () async {
          // Arrange
          final wallet = WalletEntity(name: 'John Doe', balance: 1000);
          walletStreamController.add(wallet);
          await Future<void>.delayed(Duration.zero);

          expect(homeViewModel.state.balance, 1000.0);
          expect(homeViewModel.state.username, 'John Doe');
          expect(homeViewModel.state.isBalanceHidden, true);

          // Act
          homeViewModel.toggleBalanceVisibility();

          // Assert
          expect(homeViewModel.state.balance, 1000.0);
          expect(homeViewModel.state.username, 'John Doe');
          expect(homeViewModel.state.isBalanceHidden, false);
        },
      );
    });

    group('state management', () {
      test('should properly handle wallet stream subscription', () async {
        // Arrange
        final wallet = WalletEntity(name: 'Test User', balance: 500);

        // Act
        walletStreamController.add(wallet);
        await Future<void>.delayed(Duration.zero);

        // Assert
        expect(homeViewModel.state.balance, 500.0);
        expect(homeViewModel.state.username, 'Test User');
      });
    });
  });
}
