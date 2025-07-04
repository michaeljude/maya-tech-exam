import '../result/result.dart';

/// Abstract class to handle functions related to local storage.
abstract class LocalStorageService {
  /// Clears storage.
  Future<Result<void>> clear();

  /// Delete with key.
  Future<Result<void>> delete(final String key);

  /// Retrieves from the local storage.
  Future<String?> get(final String key);

  /// Used to initialize the local storage instance.
  Future<Result<void>> initialize();

  /// Stores to the local storage.
  Future<Result<void>> save(final String key, {required final String value});
}
