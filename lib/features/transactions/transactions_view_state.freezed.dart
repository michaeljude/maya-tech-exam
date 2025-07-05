// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionsViewState {

 List<TransactionEntity> get transactions;
/// Create a copy of TransactionsViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsViewStateCopyWith<TransactionsViewState> get copyWith => _$TransactionsViewStateCopyWithImpl<TransactionsViewState>(this as TransactionsViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsViewState&&const DeepCollectionEquality().equals(other.transactions, transactions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(transactions));

@override
String toString() {
  return 'TransactionsViewState(transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class $TransactionsViewStateCopyWith<$Res>  {
  factory $TransactionsViewStateCopyWith(TransactionsViewState value, $Res Function(TransactionsViewState) _then) = _$TransactionsViewStateCopyWithImpl;
@useResult
$Res call({
 List<TransactionEntity> transactions
});




}
/// @nodoc
class _$TransactionsViewStateCopyWithImpl<$Res>
    implements $TransactionsViewStateCopyWith<$Res> {
  _$TransactionsViewStateCopyWithImpl(this._self, this._then);

  final TransactionsViewState _self;
  final $Res Function(TransactionsViewState) _then;

/// Create a copy of TransactionsViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactions = null,}) {
  return _then(_self.copyWith(
transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionEntity>,
  ));
}

}


/// @nodoc


class _TransactionsViewState implements TransactionsViewState {
   _TransactionsViewState({final  List<TransactionEntity> transactions = const []}): _transactions = transactions;
  

 final  List<TransactionEntity> _transactions;
@override@JsonKey() List<TransactionEntity> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}


/// Create a copy of TransactionsViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionsViewStateCopyWith<_TransactionsViewState> get copyWith => __$TransactionsViewStateCopyWithImpl<_TransactionsViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionsViewState&&const DeepCollectionEquality().equals(other._transactions, _transactions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_transactions));

@override
String toString() {
  return 'TransactionsViewState(transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class _$TransactionsViewStateCopyWith<$Res> implements $TransactionsViewStateCopyWith<$Res> {
  factory _$TransactionsViewStateCopyWith(_TransactionsViewState value, $Res Function(_TransactionsViewState) _then) = __$TransactionsViewStateCopyWithImpl;
@override @useResult
$Res call({
 List<TransactionEntity> transactions
});




}
/// @nodoc
class __$TransactionsViewStateCopyWithImpl<$Res>
    implements _$TransactionsViewStateCopyWith<$Res> {
  __$TransactionsViewStateCopyWithImpl(this._self, this._then);

  final _TransactionsViewState _self;
  final $Res Function(_TransactionsViewState) _then;

/// Create a copy of TransactionsViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactions = null,}) {
  return _then(_TransactionsViewState(
transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionEntity>,
  ));
}


}

// dart format on
