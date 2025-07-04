// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, lines_longer_than_80_chars

import 'package:flutter_bloc/flutter_bloc.dart';

extension CubitExtension<T> on Cubit<T> {
  void safeEmit(final T value) {
    if (isClosed) {
      return;
    }
    emit(value);
  }
}
