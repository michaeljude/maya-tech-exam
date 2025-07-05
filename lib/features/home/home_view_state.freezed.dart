// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeViewState {

 double get balance; String? get username; bool get isBalanceHidden;
/// Create a copy of HomeViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeViewStateCopyWith<HomeViewState> get copyWith => _$HomeViewStateCopyWithImpl<HomeViewState>(this as HomeViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeViewState&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.username, username) || other.username == username)&&(identical(other.isBalanceHidden, isBalanceHidden) || other.isBalanceHidden == isBalanceHidden));
}


@override
int get hashCode => Object.hash(runtimeType,balance,username,isBalanceHidden);

@override
String toString() {
  return 'HomeViewState(balance: $balance, username: $username, isBalanceHidden: $isBalanceHidden)';
}


}

/// @nodoc
abstract mixin class $HomeViewStateCopyWith<$Res>  {
  factory $HomeViewStateCopyWith(HomeViewState value, $Res Function(HomeViewState) _then) = _$HomeViewStateCopyWithImpl;
@useResult
$Res call({
 double balance, String? username, bool isBalanceHidden
});




}
/// @nodoc
class _$HomeViewStateCopyWithImpl<$Res>
    implements $HomeViewStateCopyWith<$Res> {
  _$HomeViewStateCopyWithImpl(this._self, this._then);

  final HomeViewState _self;
  final $Res Function(HomeViewState) _then;

/// Create a copy of HomeViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? balance = null,Object? username = freezed,Object? isBalanceHidden = null,}) {
  return _then(_self.copyWith(
balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,isBalanceHidden: null == isBalanceHidden ? _self.isBalanceHidden : isBalanceHidden // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _HomeViewState extends HomeViewState {
  const _HomeViewState({this.balance = 0, this.username, this.isBalanceHidden = true}): super._();
  

@override@JsonKey() final  double balance;
@override final  String? username;
@override@JsonKey() final  bool isBalanceHidden;

/// Create a copy of HomeViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeViewStateCopyWith<_HomeViewState> get copyWith => __$HomeViewStateCopyWithImpl<_HomeViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeViewState&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.username, username) || other.username == username)&&(identical(other.isBalanceHidden, isBalanceHidden) || other.isBalanceHidden == isBalanceHidden));
}


@override
int get hashCode => Object.hash(runtimeType,balance,username,isBalanceHidden);

@override
String toString() {
  return 'HomeViewState(balance: $balance, username: $username, isBalanceHidden: $isBalanceHidden)';
}


}

/// @nodoc
abstract mixin class _$HomeViewStateCopyWith<$Res> implements $HomeViewStateCopyWith<$Res> {
  factory _$HomeViewStateCopyWith(_HomeViewState value, $Res Function(_HomeViewState) _then) = __$HomeViewStateCopyWithImpl;
@override @useResult
$Res call({
 double balance, String? username, bool isBalanceHidden
});




}
/// @nodoc
class __$HomeViewStateCopyWithImpl<$Res>
    implements _$HomeViewStateCopyWith<$Res> {
  __$HomeViewStateCopyWithImpl(this._self, this._then);

  final _HomeViewState _self;
  final $Res Function(_HomeViewState) _then;

/// Create a copy of HomeViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? balance = null,Object? username = freezed,Object? isBalanceHidden = null,}) {
  return _then(_HomeViewState(
balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,isBalanceHidden: null == isBalanceHidden ? _self.isBalanceHidden : isBalanceHidden // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
