// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WalletEntity {

 String get name; double get balance;
/// Create a copy of WalletEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletEntityCopyWith<WalletEntity> get copyWith => _$WalletEntityCopyWithImpl<WalletEntity>(this as WalletEntity, _$identity);

  /// Serializes this WalletEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,balance);

@override
String toString() {
  return 'WalletEntity(name: $name, balance: $balance)';
}


}

/// @nodoc
abstract mixin class $WalletEntityCopyWith<$Res>  {
  factory $WalletEntityCopyWith(WalletEntity value, $Res Function(WalletEntity) _then) = _$WalletEntityCopyWithImpl;
@useResult
$Res call({
 String name, double balance
});




}
/// @nodoc
class _$WalletEntityCopyWithImpl<$Res>
    implements $WalletEntityCopyWith<$Res> {
  _$WalletEntityCopyWithImpl(this._self, this._then);

  final WalletEntity _self;
  final $Res Function(WalletEntity) _then;

/// Create a copy of WalletEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? balance = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _WalletEntity implements WalletEntity {
   _WalletEntity({required this.name, required this.balance});
  factory _WalletEntity.fromJson(Map<String, dynamic> json) => _$WalletEntityFromJson(json);

@override final  String name;
@override final  double balance;

/// Create a copy of WalletEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletEntityCopyWith<_WalletEntity> get copyWith => __$WalletEntityCopyWithImpl<_WalletEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WalletEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,balance);

@override
String toString() {
  return 'WalletEntity(name: $name, balance: $balance)';
}


}

/// @nodoc
abstract mixin class _$WalletEntityCopyWith<$Res> implements $WalletEntityCopyWith<$Res> {
  factory _$WalletEntityCopyWith(_WalletEntity value, $Res Function(_WalletEntity) _then) = __$WalletEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, double balance
});




}
/// @nodoc
class __$WalletEntityCopyWithImpl<$Res>
    implements _$WalletEntityCopyWith<$Res> {
  __$WalletEntityCopyWithImpl(this._self, this._then);

  final _WalletEntity _self;
  final $Res Function(_WalletEntity) _then;

/// Create a copy of WalletEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? balance = null,}) {
  return _then(_WalletEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
