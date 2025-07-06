// ignore_for_file: avoid-late-keyword, lines_longer_than_80_chars

import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'authentication_service_test.mocks.dart';

@GenerateMocks([AuthenticationRepository, LocalStorageService])
void main() {
  group('AuthenticationServiceImpl', () {
    late AuthenticationServiceImpl authenticationService;
    late MockAuthenticationRepository mockAuthenticationRepository;
    late MockLocalStorageService mockLocalStorageService;

    setUp(() {
      mockAuthenticationRepository = MockAuthenticationRepository();
      mockLocalStorageService = MockLocalStorageService();
      authenticationService = AuthenticationServiceImpl(
        authenticationRepository: mockAuthenticationRepository,
        localStorageService: mockLocalStorageService,
      );
    });

    group('signIn', () {
      const email = 'test@example.com';
      const password = 'password123';
      const username = 'testuser';
      const name = 'Test User';

      test(
        'should return success and save user data when sign in succeeds',
        () async {
          // Arrange
          final signedInEntity = AuthenticationEntity.signedIn(
            email: email,
            password: password,
            username: username,
            name: name,
          );
          final successResult = Success(
            signedInEntity,
            onRetry: () async => Future.value(),
          );
          provideDummy<Result<AuthenticationEntity>>(
            Success(signedInEntity, onRetry: () async => Future.value()),
          );
          provideDummy<Result<void>>(
            Success(null, onRetry: () async => Future.value()),
          );

          when(
            mockAuthenticationRepository.signIn(
              email: email,
              password: password,
            ),
          ).thenAnswer((_) async => successResult);
          when(mockLocalStorageService.save('email', value: email)).thenAnswer(
            (_) async => Success(null, onRetry: () async => Future.value()),
          );
          when(
            mockLocalStorageService.save('username', value: username),
          ).thenAnswer(
            (_) async => Success(null, onRetry: () async => Future.value()),
          );
          when(
            mockLocalStorageService.save('name', value: username),
          ).thenAnswer(
            (_) async => Success(null, onRetry: () async => Future.value()),
          );
          when(
            mockLocalStorageService.save(
              'isAuthenticated',
              value: 'authenticated',
            ),
          ).thenAnswer(
            (_) async => Success(null, onRetry: () async => Future.value()),
          );

          // Act
          final result = await authenticationService.signIn(
            email: email,
            password: password,
          );

          // Assert
          expect(result, isA<Success<AuthenticationEntity>>());
          expect((result as Success).value, signedInEntity);

          verify(mockLocalStorageService.save('email', value: email)).called(1);
          verify(
            mockLocalStorageService.save('username', value: username),
          ).called(1);
          verify(
            mockLocalStorageService.save('name', value: username),
          ).called(1);
          verify(
            mockLocalStorageService.save(
              'isAuthenticated',
              value: 'authenticated',
            ),
          ).called(1);
          verify(
            mockLocalStorageService.save('wallet', value: anyNamed('value')),
          ).called(1);
        },
      );

      test('should return failure when sign in fails', () async {
        // Arrange
        final failureResult = ServerFailure(
          message: 'Server error',
          onRetry: () async => Future.value(),
          stackTrace: StackTrace.current,
        );

        provideDummy<Result<AuthenticationEntity>>(
          Success(
            AuthenticationEntity.signedOut(),
            onRetry: () async => Future.value(),
          ),
        );
        provideDummy<Result<void>>(
          Success(null, onRetry: () async => Future.value()),
        );

        when(
          mockAuthenticationRepository.signIn(email: email, password: password),
        ).thenAnswer((_) async => failureResult);

        // Act
        final result = await authenticationService.signIn(
          email: email,
          password: password,
        );

        // Assert
        expect(result, isA<ServerFailure>());
        verifyNever(
          mockLocalStorageService.save(any, value: anyNamed('value')),
        );
      });

      test(
        '''should not save data when authentication entity is not SignedInAuthenticationEntity''',
        () async {
          // Arrange
          final signedOutEntity = AuthenticationEntity.signedOut();
          final successResult = Success(
            signedOutEntity,
            onRetry: () async => Future.value(),
          );

          provideDummy<Result<AuthenticationEntity>>(
            Success(signedOutEntity, onRetry: () async => Future.value()),
          );
          provideDummy<Result<void>>(
            Success(null, onRetry: () async => Future.value()),
          );

          when(
            mockAuthenticationRepository.signIn(
              email: email,
              password: password,
            ),
          ).thenAnswer((_) async => successResult);

          // Act
          final result = await authenticationService.signIn(
            email: email,
            password: password,
          );

          // Assert
          expect(result, isA<Success<AuthenticationEntity>>());
          verifyNever(
            mockLocalStorageService.save(any, value: anyNamed('value')),
          );
        },
      );
    });

    group('signOut', () {
      test('should clear local storage and return repository result', () async {
        // Arrange
        final successResult = Success(
          AuthenticationEntity.signedOut(),
          onRetry: () async => Future.value(),
        );
        provideDummy<Result<AuthenticationEntity>>(
          Success(
            AuthenticationEntity.signedOut(),
            onRetry: () async => Future.value(),
          ),
        );

        provideDummy<Result<void>>(
          Success(null, onRetry: () async => Future.value()),
        );

        when(
          mockAuthenticationRepository.signOut(),
        ).thenAnswer((_) async => successResult);

        when(mockLocalStorageService.delete(any)).thenAnswer(
          (_) async => Success(null, onRetry: () async => Future.value()),
        );

        // Act
        final result = await authenticationService.signOut();

        // Assert
        expect(result, isA<Success<AuthenticationEntity>>());
        verify(mockLocalStorageService.delete('email')).called(1);
        verify(mockLocalStorageService.delete('username')).called(1);
        verify(mockLocalStorageService.delete('name')).called(1);
        verify(mockLocalStorageService.delete('wallet')).called(1);
        verify(mockLocalStorageService.delete('isAuthenticated')).called(1);
      });

      test('should clear local storage even when repository fails', () async {
        // Arrange
        final failureResult = ServerFailure(
          message: 'Server error',
          onRetry: () async => Future.value(),
          stackTrace: StackTrace.current,
        );

        provideDummy<Result<AuthenticationEntity>>(
          Success(
            AuthenticationEntity.signedOut(),
            onRetry: () async => Future.value(),
          ),
        );
        provideDummy<Result<void>>(
          Success(null, onRetry: () async => Future.value()),
        );

        when(
          mockAuthenticationRepository.signOut(),
        ).thenAnswer((_) async => failureResult);

        when(mockLocalStorageService.delete(any)).thenAnswer(
          (_) async => Success(null, onRetry: () async => Future.value()),
        );

        // Act
        final result = await authenticationService.signOut();

        // Assert
        expect(result, isA<ServerFailure>());
        verify(mockLocalStorageService.delete('email')).called(1);
        verify(mockLocalStorageService.delete('username')).called(1);
        verify(mockLocalStorageService.delete('name')).called(1);
        verify(mockLocalStorageService.delete('wallet')).called(1);
        verify(mockLocalStorageService.delete('isAuthenticated')).called(1);
      });
    });

    group('getEmail', () {
      test('should return email from local storage', () async {
        // Arrange
        const email = 'test@example.com';
        when(
          mockLocalStorageService.get('email'),
        ).thenAnswer((_) async => email);

        // Act
        final result = await authenticationService.getEmail();

        // Assert
        expect(result, email);
        verify(mockLocalStorageService.get('email')).called(1);
      });

      test('should return null when email not found', () async {
        // Arrange
        when(
          mockLocalStorageService.get('email'),
        ).thenAnswer((_) async => null);

        // Act
        final result = await authenticationService.getEmail();

        // Assert
        expect(result, isNull);
        verify(mockLocalStorageService.get('email')).called(1);
      });
    });

    group('getName', () {
      test('should return name from local storage', () async {
        // Arrange
        const name = 'Test User';
        when(mockLocalStorageService.get('name')).thenAnswer((_) async => name);

        // Act
        final result = await authenticationService.getName();

        // Assert
        expect(result, name);
        verify(mockLocalStorageService.get('name')).called(1);
      });

      test('should return null when name not found', () async {
        // Arrange
        when(mockLocalStorageService.get('name')).thenAnswer((_) async => null);

        // Act
        final result = await authenticationService.getName();

        // Assert
        expect(result, isNull);
        verify(mockLocalStorageService.get('name')).called(1);
      });
    });

    group('getUsername', () {
      test('should return username from local storage', () async {
        // Arrange
        const username = 'testuser';
        when(
          mockLocalStorageService.get('username'),
        ).thenAnswer((_) async => username);

        // Act
        final result = await authenticationService.getUsername();

        // Assert
        expect(result, username);
        verify(mockLocalStorageService.get('username')).called(1);
      });

      test('should return null when username not found', () async {
        // Arrange
        when(
          mockLocalStorageService.get('username'),
        ).thenAnswer((_) async => null);

        // Act
        final result = await authenticationService.getUsername();

        // Assert
        expect(result, isNull);
        verify(mockLocalStorageService.get('username')).called(1);
      });
    });
  });
}
