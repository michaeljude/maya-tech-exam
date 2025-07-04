import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:monorepo/l10n/app_localizations.dart';
import 'package:monorepo/router/app_router.dart';

class App extends StatelessWidget {
  const App({required this.router, super.key});

  static const _title = 'Maya';

  final AppRouter router;

  @override
  Widget build(final BuildContext context) => MaterialApp.router(
    routerConfig: router.config(),
    title: _title,
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('en'), // English.
    ],
    debugShowCheckedModeBanner: false,
  );
}
