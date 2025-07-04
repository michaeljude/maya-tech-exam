import 'dart:async';

extension StreamExtension<T> on StreamController<T> {
  void safeAdd(final T value) {
    if (isClosed) {
      return;
    }
    add(value);
  }
}
