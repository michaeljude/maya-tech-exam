// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthenticationEntity {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationEntity);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationEntity()';
}


}

/// @nodoc
class $AuthenticationEntityCopyWith<$Res>  {
$AuthenticationEntityCopyWith(AuthenticationEntity _, $Res Function(AuthenticationEntity) __);
}


/// @nodoc


class LoadingAuthenticationEntity implements AuthenticationEntity {
   LoadingAuthenticationEntity();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingAuthenticationEntity);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationEntity.loading()';
}


}




/// @nodoc


class SignedInAuthenticationEntity implements AuthenticationEntity {
   SignedInAuthenticationEntity({required final  List<String> permissions, required final  List<String> roles, required this.session}): _permissions = permissions,_roles = roles;
  

 final  List<String> _permissions;
 List<String> get permissions {
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permissions);
}

 final  List<String> _roles;
 List<String> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}

 final  SessionEntity session;

/// Create a copy of AuthenticationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignedInAuthenticationEntityCopyWith<SignedInAuthenticationEntity> get copyWith => _$SignedInAuthenticationEntityCopyWithImpl<SignedInAuthenticationEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignedInAuthenticationEntity&&const DeepCollectionEquality().equals(other._permissions, _permissions)&&const DeepCollectionEquality().equals(other._roles, _roles)&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_permissions),const DeepCollectionEquality().hash(_roles),session);

@override
String toString() {
  return 'AuthenticationEntity.signedIn(permissions: $permissions, roles: $roles, session: $session)';
}


}

/// @nodoc
abstract mixin class $SignedInAuthenticationEntityCopyWith<$Res> implements $AuthenticationEntityCopyWith<$Res> {
  factory $SignedInAuthenticationEntityCopyWith(SignedInAuthenticationEntity value, $Res Function(SignedInAuthenticationEntity) _then) = _$SignedInAuthenticationEntityCopyWithImpl;
@useResult
$Res call({
 List<String> permissions, List<String> roles, SessionEntity session
});


$SessionEntityCopyWith<$Res> get session;

}
/// @nodoc
class _$SignedInAuthenticationEntityCopyWithImpl<$Res>
    implements $SignedInAuthenticationEntityCopyWith<$Res> {
  _$SignedInAuthenticationEntityCopyWithImpl(this._self, this._then);

  final SignedInAuthenticationEntity _self;
  final $Res Function(SignedInAuthenticationEntity) _then;

/// Create a copy of AuthenticationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? permissions = null,Object? roles = null,Object? session = null,}) {
  return _then(SignedInAuthenticationEntity(
permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<String>,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as SessionEntity,
  ));
}

/// Create a copy of AuthenticationEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionEntityCopyWith<$Res> get session {
  
  return $SessionEntityCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

/// @nodoc


class SignedOutAuthenticationEntity implements AuthenticationEntity {
   SignedOutAuthenticationEntity({this.errorMessage});
  

 final  String? errorMessage;

/// Create a copy of AuthenticationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignedOutAuthenticationEntityCopyWith<SignedOutAuthenticationEntity> get copyWith => _$SignedOutAuthenticationEntityCopyWithImpl<SignedOutAuthenticationEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignedOutAuthenticationEntity&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'AuthenticationEntity.signedOut(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SignedOutAuthenticationEntityCopyWith<$Res> implements $AuthenticationEntityCopyWith<$Res> {
  factory $SignedOutAuthenticationEntityCopyWith(SignedOutAuthenticationEntity value, $Res Function(SignedOutAuthenticationEntity) _then) = _$SignedOutAuthenticationEntityCopyWithImpl;
@useResult
$Res call({
 String? errorMessage
});




}
/// @nodoc
class _$SignedOutAuthenticationEntityCopyWithImpl<$Res>
    implements $SignedOutAuthenticationEntityCopyWith<$Res> {
  _$SignedOutAuthenticationEntityCopyWithImpl(this._self, this._then);

  final SignedOutAuthenticationEntity _self;
  final $Res Function(SignedOutAuthenticationEntity) _then;

/// Create a copy of AuthenticationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = freezed,}) {
  return _then(SignedOutAuthenticationEntity(
errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
