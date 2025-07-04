import 'package:data_flutter_secure_storage/data_flutter_secure_storage.dart';
import 'package:data_maya_services/data_maya_services.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import '../app/app.dart';
import '../router/app_router.dart';
import 'features/authentication/authentication_view_model.dart';

void main() async {
  hierarchicalLoggingEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize local storage first.
  final localStorageService = LocalStorageServiceImpl(
    localStorageRepository: FlutterSecureStorageLocalStorageRepository(),
  );
  final dio = Dio();
  dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  final authenticationService = AuthenticationServiceImpl(
    localStorageService: localStorageService,
    authenticationRepository: MayaServices(
      mayaApiServices: MayaApiServices(dio),
    ),
  );
  final localStorageResult = await localStorageService.initialize();
  if (localStorageResult case Success()) {
    Logger.root.info('Local storage initialized successfully');
  }

  // Create app router with ready authentication service.
  final appRouter = AppRouter(localStorageService: localStorageService);

  runApp(
    MultiProvider(
      providers: [
        Provider<AuthenticationService>(create: (_) => authenticationService),
        Provider<LocalStorageService>(create: (_) => localStorageService),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationViewModel>(
            create: (_) => AuthenticationViewModel(
              authenticationService: authenticationService,
              appRouter: appRouter,
            ),
          ),
        ],
        child: App(router: appRouter),
      ),
    ),
  );
}
