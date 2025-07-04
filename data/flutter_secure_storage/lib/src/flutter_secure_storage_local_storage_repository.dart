import 'package:domain/domain.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';

/// Flutter secure storage local storage repository.
class FlutterSecureStorageLocalStorageRepository
    implements LocalStorageRepository {
  final _flutterSecureStorage = const FlutterSecureStorage(
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      keyCipherAlgorithm:
          KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
      storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
    ),
  );

  @override
  Future<Result<void>> clear() async {
    try {
      await _flutterSecureStorage.deleteAll();

      return Success(null, onRetry: clear);
    } catch (error, stackTrace) {
      Logger.root.severe('Failed to clear secure storage', error, stackTrace);

      return UnknownFailure(
        message: error.toString(),
        onRetry: clear,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<Result<void>> delete(final String key) async {
    try {
      await _flutterSecureStorage.delete(key: key);

      return Success(null, onRetry: () => delete(key));
    } catch (error, stackTrace) {
      Logger.root.severe(
        'Failed to delete value for key: $key',
        error,
        stackTrace,
      );

      return UnknownFailure(
        message: error.toString(),
        onRetry: () => delete(key),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<String?> get(final String key) async {
    try {
      return await _flutterSecureStorage.read(key: key);
    } catch (error, stackTrace) {
      Logger.root.severe(
        'Failed to get value for key: $key',
        error,
        stackTrace,
      );

      return null;
    }
  }

  @override
  Future<Result<Map<String, String>>> initialize() async {
    try {
      return Success(
        await _flutterSecureStorage.readAll(),
        onRetry: initialize,
      );
    } catch (error, stackTrace) {
      Logger.root.severe(
        'Failed to initialize secure storage',
        error,
        stackTrace,
      );

      return UnknownFailure(
        message: error.toString(),
        onRetry: initialize,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<Result<void>> save(
    final String key, {
    required final String value,
  }) async {
    try {
      return Success(
        await _flutterSecureStorage.write(key: key, value: value),
        onRetry: () => save(key, value: value),
      );
    } catch (error, stackTrace) {
      Logger.root.severe(
        'Failed to save value for key: $key',
        error,
        stackTrace,
      );

      return UnknownFailure(
        message: error.toString(),
        onRetry: () => save(key, value: value),
        stackTrace: stackTrace,
      );
    }
  }
}
