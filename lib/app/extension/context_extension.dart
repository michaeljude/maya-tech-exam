import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  String get localeString => Localizations.localeOf(this).toString();

  AppLocalizations get intl {
    final appLocalization = AppLocalizations.of(this);
    if (appLocalization == null) {
      throw Exception('AppLocalizations not initialized');
    }

    return appLocalization;
  }
}
