import 'package:data_flutter_secure_storage/data_flutter_secure_storage.dart';
import 'package:data_maya_services/data_maya_services.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:monorepo/app/app.dart';
import 'package:monorepo/router/app_router.dart';
import 'package:provider/provider.dart';

void main() async {
  hierarchicalLoggingEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize local storage first.
  final localStorageService = LocalStorageServiceImpl(
    localStorageRepository: FlutterSecureStorageLocalStorageRepository(),
  );
  final authenticationService = AuthenticationServiceImpl(
    localStorageService: localStorageService,
    authenticationRepository: MayaServices(),
  );
  final localStorageResult = await localStorageService.initialize();
  if (localStorageResult case Success()) {
    Logger.root.info('Local storage initialized successfully');
  }

  // Create app router with ready authentication service.
  final autoRoute = AppRouter(authenticationService: authenticationService);

  runApp(
    MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => authenticationService,
        ),
        Provider<LocalStorageService>(
          create: (_) => localStorageService,
        ),
      ],
      child: App(router: autoRoute),
    ),
  );
}
