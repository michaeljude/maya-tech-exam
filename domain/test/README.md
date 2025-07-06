# Domain Layer Tests

This directory contains unit tests for the domain layer services.

## Test Structure

### Services Tests
- `services/authentication_service_test.dart` - Unit tests for AuthenticationService (requires generated mocks)
- `services/wallet_service_test.dart` - Unit tests for WalletService (requires generated mocks)

## Running Tests

### With Generated Mocks
To run tests with proper Mockito-generated mocks:

1. Generate the mock files:
```bash
cd domain
dart run build_runner build
```

2. Run all tests:
```bash
flutter test
```

3. Run specific service tests:
```bash
flutter test test/services/authentication_service_test.dart
flutter test test/services/wallet_service_test.dart
```

## Test Coverage

### AuthenticationService
- ✅ Sign in with valid credentials
- ✅ Sign in with invalid credentials
- ✅ Sign out and clear data
- ✅ Retrieve user data from storage
- ✅ Handle different authentication entity types

### WalletService
- ✅ Initialize wallet from storage
- ✅ Create new wallet when none exists
- ✅ Send money successfully
- ✅ Handle insufficient balance
- ✅ Handle repository failures
- ✅ Manage transactions
- ✅ Handle invalid wallet data
- ✅ Stream wallet updates with BehaviorSubject
- ✅ Test wallet value getter
- ✅ Handle null username scenarios

## Mock Strategy

The tests use Mockito-generated mocks for sophisticated mocking scenarios:

- **Generated Mocks**: Use `@GenerateMocks` for detailed unit tests with complex mocking
- **Stream Testing**: Proper testing of BehaviorSubject streams with `expectLater` and `emitsInOrder`
- **Async Testing**: Comprehensive testing of async operations and stream emissions

## Adding New Tests

When adding new tests:

1. For detailed unit tests with complex mocking, create a new file in `services/` and use `@GenerateMocks`
2. Follow the established patterns for stream testing and async operations
3. Update this README with new test coverage information 