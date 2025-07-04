// ignore_for_file: avoid-late-keyword

import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import '../features/login/login_guard.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page|View,Route')
class AppRouter extends RootStackRouter {

  AppRouter({required final LocalStorageService localStorageService})
    : _localStorageService = localStorageService;
    
  final LocalStorageService _localStorageService;

  static const _login = '/login';
  static const _home = '/home';
  static const _sendMoney = '/send_money';
  static const _transactions = '/transactions';

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      path: _home,
      initial: true,
      guards: [LoginGuard(localStorageService: _localStorageService)],
    ),
    AutoRoute(page: LoginRoute.page, path: _login),
    AutoRoute(page: SendMoneyRoute.page, path: _sendMoney),
    AutoRoute(page: TransactionsRoute.page, path: _transactions),
  ];
}
