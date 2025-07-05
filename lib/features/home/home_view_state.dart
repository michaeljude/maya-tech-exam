import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_view_state.freezed.dart';

@freezed
abstract class HomeViewState with _$HomeViewState {
  const factory HomeViewState({
    @Default(0) final double balance,
    final String? username,
    @Default(true) final bool isBalanceHidden,
  }) = _HomeViewState;

  const HomeViewState._();

  String get welcomeText => username != null ? 'Hi, $username' : 'Hi, there';
}
