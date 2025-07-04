// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionEntity {

 String get accessToken; int? get expiresIn; String? get refreshToken;
/// Create a copy of SessionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionEntityCopyWith<SessionEntity> get copyWith => _$SessionEntityCopyWithImpl<SessionEntity>(this as SessionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionEntity&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}


@override
int get hashCode => Object.hash(runtimeType,accessToken,expiresIn,refreshToken);

@override
String toString() {
  return 'SessionEntity(accessToken: $accessToken, expiresIn: $expiresIn, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $SessionEntityCopyWith<$Res>  {
  factory $SessionEntityCopyWith(SessionEntity value, $Res Function(SessionEntity) _then) = _$SessionEntityCopyWithImpl;
@useResult
$Res call({
 String accessToken, int? expiresIn, String? refreshToken
});




}
/// @nodoc
class _$SessionEntityCopyWithImpl<$Res>
    implements $SessionEntityCopyWith<$Res> {
  _$SessionEntityCopyWithImpl(this._self, this._then);

  final SessionEntity _self;
  final $Res Function(SessionEntity) _then;

/// Create a copy of SessionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? expiresIn = freezed,Object? refreshToken = freezed,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _SessionEntity implements SessionEntity {
   _SessionEntity({required this.accessToken, required this.expiresIn, required this.refreshToken});
  

@override final  String accessToken;
@override final  int? expiresIn;
@override final  String? refreshToken;

/// Create a copy of SessionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionEntityCopyWith<_SessionEntity> get copyWith => __$SessionEntityCopyWithImpl<_SessionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionEntity&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}


@override
int get hashCode => Object.hash(runtimeType,accessToken,expiresIn,refreshToken);

@override
String toString() {
  return 'SessionEntity(accessToken: $accessToken, expiresIn: $expiresIn, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$SessionEntityCopyWith<$Res> implements $SessionEntityCopyWith<$Res> {
  factory _$SessionEntityCopyWith(_SessionEntity value, $Res Function(_SessionEntity) _then) = __$SessionEntityCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, int? expiresIn, String? refreshToken
});




}
/// @nodoc
class __$SessionEntityCopyWithImpl<$Res>
    implements _$SessionEntityCopyWith<$Res> {
  __$SessionEntityCopyWithImpl(this._self, this._then);

  final _SessionEntity _self;
  final $Res Function(_SessionEntity) _then;

/// Create a copy of SessionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? expiresIn = freezed,Object? refreshToken = freezed,}) {
  return _then(_SessionEntity(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
