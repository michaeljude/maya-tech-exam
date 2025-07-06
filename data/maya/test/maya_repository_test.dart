// ignore_for_file: avoid-late-keyword,
// missing_whitespace_between_adjacent_strings

import 'package:data_json_serializable/data_json_serializable.dart';
import 'package:data_maya/src/maya_api_repository.dart';
import 'package:data_maya/src/maya_repository.dart';
import 'package:domain/src/entities/authentication_entity.dart';
import 'package:domain/src/result/result.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'maya_repository_test.mocks.dart';

@GenerateMocks([MayaApiRepository])
void main() {
  group('MayaRepository', () {
    late MayaRepository repository;
    late MockMayaApiRepository mockApiRepository;

    setUp(() {
      mockApiRepository = MockMayaApiRepository();
      repository = MayaRepository(mayaApiRepository: mockApiRepository);
    });

    group('signIn', () {
      const email = 'test@example.com';
      const password = 'password123';
      const username = 'testuser';
      const name = 'Test User';

      const mockUser = AuthenticationDto(
        email: email,
        username: username,
        name: name,
      );

      test(
        '''should return Success with AuthenticationEntity when sign in is successful''',
        () async {
          // Arrange
          when(
            mockApiRepository.signIn(email: email, password: password),
          ).thenAnswer(
            (_) async => Success(null, onRetry: () async => Future.value()),
          );
          when(
            mockApiRepository.getUsers(),
          ).thenAnswer((_) async => [mockUser]);

          // Act
          final result = await repository.signIn(
            email: email,
            password: password,
          );

          // Assert
          expect(result, isA<Success<AuthenticationEntity>>());
          final successResult = result as Success<AuthenticationEntity>;
          expect(successResult.value, isA<SignedInAuthenticationEntity>());

          final authEntity =
              successResult.value as SignedInAuthenticationEntity;
          expect(authEntity.email, equals(email));
          expect(authEntity.password, equals(password));
          expect(authEntity.username, equals(username));
          expect(authEntity.name, equals(name));

          verify(
            mockApiRepository.signIn(email: email, password: password),
          ).called(1);
          verify(mockApiRepository.getUsers()).called(1);
        },
      );

      test(
        'should return UnknownFailure when user is not found in users list',
        () async {
          // Arrange
          when(
            mockApiRepository.signIn(email: email, password: password),
          ).thenAnswer(
            (_) async => Success(null, onRetry: () async => Future.value()),
          );
          when(mockApiRepository.getUsers()).thenAnswer((_) async => []);

          // Act
          final result = await repository.signIn(
            email: email,
            password: password,
          );

          // Assert
          expect(result, isA<UnknownFailure>());
          final failureResult = result as UnknownFailure;
          expect(failureResult.message, contains('User not found'));

          verify(
            mockApiRepository.signIn(email: email, password: password),
          ).called(1);
          verify(mockApiRepository.getUsers()).called(1);
        },
      );

      test(
        'should return UnknownFailure when signIn API call throws exception',
        () async {
          // Arrange
          const errorMessage = 'Network error';
          when(
            mockApiRepository.signIn(email: email, password: password),
          ).thenThrow(Exception(errorMessage));

          // Act
          final result = await repository.signIn(
            email: email,
            password: password,
          );

          // Assert
          expect(result, isA<UnknownFailure>());
          final failureResult = result as UnknownFailure;
          expect(failureResult.message, contains(errorMessage));

          verify(
            mockApiRepository.signIn(email: email, password: password),
          ).called(1);
          verifyNever(mockApiRepository.getUsers());
        },
      );

      test(
        'should return UnknownFailure when getUsers API call throws exception',
        () async {
          // Arrange
          const errorMessage = 'Server error';
          when(
            mockApiRepository.signIn(email: email, password: password),
          ).thenAnswer(
            (_) async => Success(null, onRetry: () async => Future.value()),
          );
          when(mockApiRepository.getUsers()).thenThrow(Exception(errorMessage));

          // Act
          final result = await repository.signIn(
            email: email,
            password: password,
          );

          // Assert
          expect(result, isA<UnknownFailure>());
          final failureResult = result as UnknownFailure;
          expect(failureResult.message, contains(errorMessage));

          verify(
            mockApiRepository.signIn(email: email, password: password),
          ).called(1);
          verify(mockApiRepository.getUsers()).called(1);
        },
      );

      test('should find correct user when multiple users exist', () async {
        // Arrange
        const otherUser = AuthenticationDto(
          email: 'other@example.com',
          username: 'otheruser',
          name: 'Other User',
        );

        when(
          mockApiRepository.signIn(email: email, password: password),
        ).thenAnswer(
          (_) async => Success(null, onRetry: () async => Future.value()),
        );
        when(
          mockApiRepository.getUsers(),
        ).thenAnswer((_) async => [otherUser, mockUser]);

        // Act
        final result = await repository.signIn(
          email: email,
          password: password,
        );

        // Assert
        expect(result, isA<Success<AuthenticationEntity>>());
        final successResult = result as Success<AuthenticationEntity>;
        final authEntity = successResult.value as SignedInAuthenticationEntity;
        expect(authEntity.email, equals(email));
        expect(authEntity.username, equals(username));
        expect(authEntity.name, equals(name));
      });
    });

    group('signOut', () {
      test(
        '''should return Success with signed out AuthenticationEntity when logout is successful''',
        () async {
          // Arrange
          when(mockApiRepository.logout()).thenAnswer(
            (_) async => Success(null, onRetry: () async => Future.value()),
          );

          // Act
          final result = await repository.signOut();

          // Assert
          expect(result, isA<Success<AuthenticationEntity>>());
          final successResult = result as Success<AuthenticationEntity>;
          expect(successResult.value, isA<SignedOutAuthenticationEntity>());

          verify(mockApiRepository.logout()).called(1);
        },
      );

      test(
        'should return UnknownFailure when logout API call throws exception',
        () async {
          // Arrange
          const errorMessage = 'Logout failed';
          when(mockApiRepository.logout()).thenThrow(Exception(errorMessage));

          // Act
          final result = await repository.signOut();

          // Assert
          expect(result, isA<UnknownFailure>());
          final failureResult = result as UnknownFailure;
          expect(failureResult.message, contains(errorMessage));

          verify(mockApiRepository.logout()).called(1);
        },
      );
    });

    group('sendMoney', () {
      const amount = 100.0;
      const recipient = 'recipient@example.com';

      test('should return Success when send money is successful', () async {
        // Arrange
        when(
          mockApiRepository.sendMoney(amount: amount, recipient: recipient),
        ).thenAnswer(
          (_) async => Success(null, onRetry: () async => Future.value()),
        );

        // Act
        final result = await repository.sendMoney(
          amount: amount,
          recipient: recipient,
        );

        // Assert
        expect(result, isA<Success<void>>());

        verify(
          mockApiRepository.sendMoney(amount: amount, recipient: recipient),
        ).called(1);
      });

      test(
        '''should return UnknownFailure when send money API call throws exception''',
        () async {
          // Arrange
          const errorMessage = 'Insufficient funds';
          when(
            mockApiRepository.sendMoney(amount: amount, recipient: recipient),
          ).thenThrow(Exception(errorMessage));

          // Act
          final result = await repository.sendMoney(
            amount: amount,
            recipient: recipient,
          );

          // Assert
          expect(result, isA<UnknownFailure>());
          final failureResult = result as UnknownFailure;
          expect(failureResult.message, contains(errorMessage));

          verify(
            mockApiRepository.sendMoney(amount: amount, recipient: recipient),
          ).called(1);
        },
      );

      test('should handle zero amount', () async {
        // Arrange
        const zeroAmount = 0.0;
        when(
          mockApiRepository.sendMoney(amount: zeroAmount, recipient: recipient),
        ).thenAnswer(
          (_) async => Success(null, onRetry: () async => Future.value()),
        );

        // Act
        final result = await repository.sendMoney(
          amount: zeroAmount,
          recipient: recipient,
        );

        // Assert
        expect(result, isA<Success<void>>());
        verify(
          mockApiRepository.sendMoney(amount: zeroAmount, recipient: recipient),
        ).called(1);
      });

      test('should handle large amount', () async {
        // Arrange
        const largeAmount = 999999.99;
        when(
          mockApiRepository.sendMoney(
            amount: largeAmount,
            recipient: recipient,
          ),
        ).thenAnswer(
          (_) async => Success(null, onRetry: () async => Future.value()),
        );

        // Act
        final result = await repository.sendMoney(
          amount: largeAmount,
          recipient: recipient,
        );

        // Assert
        expect(result, isA<Success<void>>());
        verify(
          mockApiRepository.sendMoney(
            amount: largeAmount,
            recipient: recipient,
          ),
        ).called(1);
      });
    });

    group('retry functionality', () {
      test('signIn onRetry should call signIn again', () async {
        // Arrange
        const email = 'test@example.com';
        const password = 'password123';
        const mockUser = AuthenticationDto(
          email: email,
          username: 'testuser',
          name: 'Test User',
        );

        when(
          mockApiRepository.signIn(email: email, password: password),
        ).thenAnswer(
          (_) async => Success(null, onRetry: () async => Future.value()),
        );
        when(mockApiRepository.getUsers()).thenAnswer((_) async => [mockUser]);

        // Act
        final result = await repository.signIn(
          email: email,
          password: password,
        );

        // Assert
        expect(result, isA<Success<AuthenticationEntity>>());
        final successResult = result as Success<AuthenticationEntity>;

        // Test retry functionality
        await successResult.onRetry();
        verify(
          mockApiRepository.signIn(email: email, password: password),
        ).called(2);
        verify(mockApiRepository.getUsers()).called(2);
      });

      test('signOut onRetry should call signOut again', () async {
        // Arrange
        when(mockApiRepository.logout()).thenAnswer(
          (_) async => Success(null, onRetry: () async => Future.value()),
        );

        // Act
        final result = await repository.signOut();

        // Assert
        expect(result, isA<Success<AuthenticationEntity>>());
        final successResult = result as Success<AuthenticationEntity>;

        // Test retry functionality
        await successResult.onRetry();
        verify(mockApiRepository.logout()).called(2);
      });

      test('sendMoney onRetry should call sendMoney again', () async {
        // Arrange
        const amount = 100.0;
        const recipient = 'recipient@example.com';

        when(
          mockApiRepository.sendMoney(amount: amount, recipient: recipient),
        ).thenAnswer(
          (_) async => Success(null, onRetry: () async => Future.value()),
        );

        // Act
        final result = await repository.sendMoney(
          amount: amount,
          recipient: recipient,
        );

        // Assert
        expect(result, isA<Success<void>>());
        final successResult = result as Success<void>;

        // Test retry functionality
        await successResult.onRetry();
        verify(
          mockApiRepository.sendMoney(amount: amount, recipient: recipient),
        ).called(2);
      });

      test('failure onRetry should call the original method again', () async {
        // Arrange
        const email = 'test@example.com';
        const password = 'password123';
        const errorMessage = 'Network error';

        when(
          mockApiRepository.signIn(email: email, password: password),
        ).thenThrow(Exception(errorMessage));

        // Act
        final result = await repository.signIn(
          email: email,
          password: password,
        );

        // Assert
        expect(result, isA<UnknownFailure>());
        final failureResult = result as UnknownFailure;

        // Test retry functionality
        await failureResult.onRetry();
        verify(
          mockApiRepository.signIn(email: email, password: password),
        ).called(2);
      });
    });
  });
}
