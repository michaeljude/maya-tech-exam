import 'package:domain/domain.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Shared preferences local storage repository.
class SharedPreferencesLocalStorageRepository
    implements LocalStorageRepository {
  SharedPreferences? _sharedPreferences;

  @override
  Future<Result<void>> clear() async {
    try {
      await _sharedPreferences?.clear();

      return Success(null, onRetry: clear);
    } catch (error, stackTrace) {
      Logger.root.severe(
        'Failed to clear shared preferences',
        error,
        stackTrace,
      );

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
      await _sharedPreferences?.remove(key);

      return Success(null, onRetry: () => delete(key));
    } catch (error, stackTrace) {
      Logger.root.severe(
        'Failed to delete key "$key" from shared preferences',
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
      return _sharedPreferences?.getString(key);
    } catch (error, stackTrace) {
      Logger.root.severe(
        'Failed to get key "$key" from shared preferences',
        error,
        stackTrace,
      );

      return null;
    }
  }

  @override
  Future<Result<Map<String, String>>> initialize() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();

      final isFirstRun = _sharedPreferences?.getString('firstRun') ?? 'false';

      return Success({
        'firstRun': isFirstRun,
      }, onRetry: initialize);
    } catch (error, stackTrace) {
      Logger.root.severe(
        'Failed to initialize shared preferences',
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
      await _sharedPreferences?.setString(key, value);

      return Success(null, onRetry: () => save(key, value: value));
    } catch (error, stackTrace) {
      Logger.root.severe(
        'Failed to save key "$key" with value "$value" to shared preferences',
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
