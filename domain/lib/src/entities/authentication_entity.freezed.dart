// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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


/// Adds pattern-matching-related methods to [AuthenticationEntity].
extension AuthenticationEntityPatterns on AuthenticationEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingAuthenticationEntity value)?  loading,TResult Function( SignedInAuthenticationEntity value)?  signedIn,TResult Function( SignedOutAuthenticationEntity value)?  signedOut,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingAuthenticationEntity() when loading != null:
return loading(_that);case SignedInAuthenticationEntity() when signedIn != null:
return signedIn(_that);case SignedOutAuthenticationEntity() when signedOut != null:
return signedOut(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingAuthenticationEntity value)  loading,required TResult Function( SignedInAuthenticationEntity value)  signedIn,required TResult Function( SignedOutAuthenticationEntity value)  signedOut,}){
final _that = this;
switch (_that) {
case LoadingAuthenticationEntity():
return loading(_that);case SignedInAuthenticationEntity():
return signedIn(_that);case SignedOutAuthenticationEntity():
return signedOut(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingAuthenticationEntity value)?  loading,TResult? Function( SignedInAuthenticationEntity value)?  signedIn,TResult? Function( SignedOutAuthenticationEntity value)?  signedOut,}){
final _that = this;
switch (_that) {
case LoadingAuthenticationEntity() when loading != null:
return loading(_that);case SignedInAuthenticationEntity() when signedIn != null:
return signedIn(_that);case SignedOutAuthenticationEntity() when signedOut != null:
return signedOut(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String email,  String password)?  signedIn,TResult Function( String? errorMessage)?  signedOut,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingAuthenticationEntity() when loading != null:
return loading();case SignedInAuthenticationEntity() when signedIn != null:
return signedIn(_that.email,_that.password);case SignedOutAuthenticationEntity() when signedOut != null:
return signedOut(_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String email,  String password)  signedIn,required TResult Function( String? errorMessage)  signedOut,}) {final _that = this;
switch (_that) {
case LoadingAuthenticationEntity():
return loading();case SignedInAuthenticationEntity():
return signedIn(_that.email,_that.password);case SignedOutAuthenticationEntity():
return signedOut(_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String email,  String password)?  signedIn,TResult? Function( String? errorMessage)?  signedOut,}) {final _that = this;
switch (_that) {
case LoadingAuthenticationEntity() when loading != null:
return loading();case SignedInAuthenticationEntity() when signedIn != null:
return signedIn(_that.email,_that.password);case SignedOutAuthenticationEntity() when signedOut != null:
return signedOut(_that.errorMessage);case _:
  return null;

}
}

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
   SignedInAuthenticationEntity({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthenticationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignedInAuthenticationEntityCopyWith<SignedInAuthenticationEntity> get copyWith => _$SignedInAuthenticationEntityCopyWithImpl<SignedInAuthenticationEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignedInAuthenticationEntity&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthenticationEntity.signedIn(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $SignedInAuthenticationEntityCopyWith<$Res> implements $AuthenticationEntityCopyWith<$Res> {
  factory $SignedInAuthenticationEntityCopyWith(SignedInAuthenticationEntity value, $Res Function(SignedInAuthenticationEntity) _then) = _$SignedInAuthenticationEntityCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$SignedInAuthenticationEntityCopyWithImpl<$Res>
    implements $SignedInAuthenticationEntityCopyWith<$Res> {
  _$SignedInAuthenticationEntityCopyWithImpl(this._self, this._then);

  final SignedInAuthenticationEntity _self;
  final $Res Function(SignedInAuthenticationEntity) _then;

/// Create a copy of AuthenticationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(SignedInAuthenticationEntity(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
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
