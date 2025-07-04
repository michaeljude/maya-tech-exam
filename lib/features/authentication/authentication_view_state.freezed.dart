// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthenticationViewState {

 GlobalKey<FormState> get formKey; TextEditingController get emailController; TextEditingController get passwordController;// flags
 bool get isLoading; bool get isSigningOut; bool get isSuccess; String? get errorMessage;
/// Create a copy of AuthenticationViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticationViewStateCopyWith<AuthenticationViewState> get copyWith => _$AuthenticationViewStateCopyWithImpl<AuthenticationViewState>(this as AuthenticationViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationViewState&&(identical(other.formKey, formKey) || other.formKey == formKey)&&(identical(other.emailController, emailController) || other.emailController == emailController)&&(identical(other.passwordController, passwordController) || other.passwordController == passwordController)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSigningOut, isSigningOut) || other.isSigningOut == isSigningOut)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,formKey,emailController,passwordController,isLoading,isSigningOut,isSuccess,errorMessage);

@override
String toString() {
  return 'AuthenticationViewState(formKey: $formKey, emailController: $emailController, passwordController: $passwordController, isLoading: $isLoading, isSigningOut: $isSigningOut, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $AuthenticationViewStateCopyWith<$Res>  {
  factory $AuthenticationViewStateCopyWith(AuthenticationViewState value, $Res Function(AuthenticationViewState) _then) = _$AuthenticationViewStateCopyWithImpl;
@useResult
$Res call({
 GlobalKey<FormState> formKey, TextEditingController emailController, TextEditingController passwordController, bool isLoading, bool isSigningOut, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class _$AuthenticationViewStateCopyWithImpl<$Res>
    implements $AuthenticationViewStateCopyWith<$Res> {
  _$AuthenticationViewStateCopyWithImpl(this._self, this._then);

  final AuthenticationViewState _self;
  final $Res Function(AuthenticationViewState) _then;

/// Create a copy of AuthenticationViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? formKey = null,Object? emailController = null,Object? passwordController = null,Object? isLoading = null,Object? isSigningOut = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
formKey: null == formKey ? _self.formKey : formKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormState>,emailController: null == emailController ? _self.emailController : emailController // ignore: cast_nullable_to_non_nullable
as TextEditingController,passwordController: null == passwordController ? _self.passwordController : passwordController // ignore: cast_nullable_to_non_nullable
as TextEditingController,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSigningOut: null == isSigningOut ? _self.isSigningOut : isSigningOut // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _AuthenticationViewState implements AuthenticationViewState {
   _AuthenticationViewState({required this.formKey, required this.emailController, required this.passwordController, this.isLoading = false, this.isSigningOut = false, this.isSuccess = false, this.errorMessage});
  

@override final  GlobalKey<FormState> formKey;
@override final  TextEditingController emailController;
@override final  TextEditingController passwordController;
// flags
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSigningOut;
@override@JsonKey() final  bool isSuccess;
@override final  String? errorMessage;

/// Create a copy of AuthenticationViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthenticationViewStateCopyWith<_AuthenticationViewState> get copyWith => __$AuthenticationViewStateCopyWithImpl<_AuthenticationViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthenticationViewState&&(identical(other.formKey, formKey) || other.formKey == formKey)&&(identical(other.emailController, emailController) || other.emailController == emailController)&&(identical(other.passwordController, passwordController) || other.passwordController == passwordController)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSigningOut, isSigningOut) || other.isSigningOut == isSigningOut)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,formKey,emailController,passwordController,isLoading,isSigningOut,isSuccess,errorMessage);

@override
String toString() {
  return 'AuthenticationViewState(formKey: $formKey, emailController: $emailController, passwordController: $passwordController, isLoading: $isLoading, isSigningOut: $isSigningOut, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AuthenticationViewStateCopyWith<$Res> implements $AuthenticationViewStateCopyWith<$Res> {
  factory _$AuthenticationViewStateCopyWith(_AuthenticationViewState value, $Res Function(_AuthenticationViewState) _then) = __$AuthenticationViewStateCopyWithImpl;
@override @useResult
$Res call({
 GlobalKey<FormState> formKey, TextEditingController emailController, TextEditingController passwordController, bool isLoading, bool isSigningOut, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class __$AuthenticationViewStateCopyWithImpl<$Res>
    implements _$AuthenticationViewStateCopyWith<$Res> {
  __$AuthenticationViewStateCopyWithImpl(this._self, this._then);

  final _AuthenticationViewState _self;
  final $Res Function(_AuthenticationViewState) _then;

/// Create a copy of AuthenticationViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? formKey = null,Object? emailController = null,Object? passwordController = null,Object? isLoading = null,Object? isSigningOut = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_AuthenticationViewState(
formKey: null == formKey ? _self.formKey : formKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormState>,emailController: null == emailController ? _self.emailController : emailController // ignore: cast_nullable_to_non_nullable
as TextEditingController,passwordController: null == passwordController ? _self.passwordController : passwordController // ignore: cast_nullable_to_non_nullable
as TextEditingController,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSigningOut: null == isSigningOut ? _self.isSigningOut : isSigningOut // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
