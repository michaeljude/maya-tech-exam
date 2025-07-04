import 'dart:async';

sealed class Result<T> {
  const Result({required this.onRetry});

  final Future<void> Function() onRetry;
}

class Success<T> extends Result<T> {
  const Success(this.value, {required super.onRetry});

  final T value;
}

sealed class Failure extends Result<Never> {
  const Failure({
    required this.message,
    required super.onRetry,
    required this.stackTrace,
  });

  /// The stack trace which provides information to the user about the call
  /// sequence that triggered an exception.
  final StackTrace stackTrace;

  /// The long form message of the exception.
  final String message;

  /// Only used in debugging. Not to be shown to the user.
  @override
  String toString() => '$message\n\n$stackTrace';
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({
    required super.message,
    required super.onRetry,
    required super.stackTrace,
  });
}

class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    required super.onRetry,
    required super.stackTrace,
  });
}

class NoConnectionFailure extends Failure {
  const NoConnectionFailure({
    required super.message,
    required super.onRetry,
    required super.stackTrace,
  });
}

class BadRequestFailure extends Failure {
  const BadRequestFailure({
    required super.message,
    required super.onRetry,
    required super.stackTrace,
  });
}

class ParsingFailure extends Failure {
  const ParsingFailure({
    required super.message,
    required super.onRetry,
    required super.stackTrace,
  });
}

class TimeoutFailure extends Failure {
  const TimeoutFailure({
    required super.message,
    required super.onRetry,
    required super.stackTrace,
  });
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({
    required super.message,
    required super.onRetry,
    required super.stackTrace,
  });
}

class UnknownFailure extends Failure {
  const UnknownFailure({
    required super.message,
    required super.onRetry,
    required super.stackTrace,
  });
}

class FileSizeExceedsFailure extends Failure {
  const FileSizeExceedsFailure({
    required super.message,
    required super.onRetry,
    required super.stackTrace,
  });
}

class UnsupportedMediaTypeFailure extends Failure {
  const UnsupportedMediaTypeFailure({
    required super.message,
    required super.onRetry,
    required super.stackTrace,
  });
}
