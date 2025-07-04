import 'package:meta/meta.dart';

import '../result/result.dart';

/// Abstract class to handle functions related to local storage.
abstract class LocalStorageService {
  /// Clears storage.
  @useResult
  Future<Result<void>> clear();

  /// Delete with key.
  @useResult
  Future<Result<void>> delete(final String key);

  /// Retrieves from the local storage.
  Future<String?> get(final String key);

  /// Used to initialize the local storage instance.
  @useResult
  Future<Result<void>> initialize();

  /// Stores to the local storage.
  @useResult
  Future<Result<void>> save(final String key, {required final String value});

  /// Stream of values.
  Stream<Map<String, String>> values();

  /// Disposes the local storage instance.
  void dispose();
}
