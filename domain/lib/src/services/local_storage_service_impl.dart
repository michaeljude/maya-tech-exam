import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../extensions/stream_extension.dart';
import '../repositories/local_storage_repository.dart';
import '../result/result.dart';
import 'local_storage_service.dart';

/// Implementation of [LocalStorageService].
class LocalStorageServiceImpl implements LocalStorageService {
  /// Default constructor.
  LocalStorageServiceImpl({
    required final LocalStorageRepository localStorageRepository,
  }) : _localStorageRepository = localStorageRepository;

  final LocalStorageRepository _localStorageRepository;
  final _localStorageStream = BehaviorSubject<Map<String, String>>.seeded({});

  @override
  Future<Result<void>> clear() async {
    final result = await _localStorageRepository.clear();
    switch (result) {
      case Success():
        _localStorageStream.safeAdd({});

        return result;

      case Failure():
        return result;
    }
  }

  @override
  Future<Result<void>> delete(final String key) async {
    final result = await _localStorageRepository.delete(key);
    switch (result) {
      case Success():
        _localStorageStream.safeAdd({
          for (final entry in _localStorageStream.value.entries)
            if (entry.key != key) entry.key: entry.value,
        });

        return result;

      case Failure():
        return result;
    }
  }

  @override
  Future<String?> get(final String key) => _localStorageRepository.get(key);

  @override
  Future<Result<void>> initialize() async {
    final result = await _localStorageRepository.initialize();
    switch (result) {
      case Success():
        _localStorageStream.safeAdd(result.value);

        return result;

      case Failure():
        return result;
    }
  }

  @override
  Future<Result<void>> save(
    final String key, {
    required final String value,
  }) async {
    final result = await _localStorageRepository.save(key, value: value);
    switch (result) {
      case Success():
        _localStorageStream.safeAdd({..._localStorageStream.value, key: value});

        return result;

      case Failure():
        return result;
    }
  }

  @override
  Stream<Map<String, String>> values() => _localStorageStream;

  @override
  void dispose() {
    unawaited(_localStorageStream.close());
  }
}
