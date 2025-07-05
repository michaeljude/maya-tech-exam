// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_money_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SendMoneyViewState {

 GlobalKey<FormState> get formKey; TextEditingController get amountController; TextEditingController get recipientController; bool get isLoading; bool get isSuccess; String? get errorMessage;
/// Create a copy of SendMoneyViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMoneyViewStateCopyWith<SendMoneyViewState> get copyWith => _$SendMoneyViewStateCopyWithImpl<SendMoneyViewState>(this as SendMoneyViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMoneyViewState&&(identical(other.formKey, formKey) || other.formKey == formKey)&&(identical(other.amountController, amountController) || other.amountController == amountController)&&(identical(other.recipientController, recipientController) || other.recipientController == recipientController)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,formKey,amountController,recipientController,isLoading,isSuccess,errorMessage);

@override
String toString() {
  return 'SendMoneyViewState(formKey: $formKey, amountController: $amountController, recipientController: $recipientController, isLoading: $isLoading, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SendMoneyViewStateCopyWith<$Res>  {
  factory $SendMoneyViewStateCopyWith(SendMoneyViewState value, $Res Function(SendMoneyViewState) _then) = _$SendMoneyViewStateCopyWithImpl;
@useResult
$Res call({
 GlobalKey<FormState> formKey, TextEditingController amountController, TextEditingController recipientController, bool isLoading, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class _$SendMoneyViewStateCopyWithImpl<$Res>
    implements $SendMoneyViewStateCopyWith<$Res> {
  _$SendMoneyViewStateCopyWithImpl(this._self, this._then);

  final SendMoneyViewState _self;
  final $Res Function(SendMoneyViewState) _then;

/// Create a copy of SendMoneyViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? formKey = null,Object? amountController = null,Object? recipientController = null,Object? isLoading = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
formKey: null == formKey ? _self.formKey : formKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormState>,amountController: null == amountController ? _self.amountController : amountController // ignore: cast_nullable_to_non_nullable
as TextEditingController,recipientController: null == recipientController ? _self.recipientController : recipientController // ignore: cast_nullable_to_non_nullable
as TextEditingController,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _SendMoneyViewState implements SendMoneyViewState {
   _SendMoneyViewState({required this.formKey, required this.amountController, required this.recipientController, this.isLoading = false, this.isSuccess = false, this.errorMessage});
  

@override final  GlobalKey<FormState> formKey;
@override final  TextEditingController amountController;
@override final  TextEditingController recipientController;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSuccess;
@override final  String? errorMessage;

/// Create a copy of SendMoneyViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendMoneyViewStateCopyWith<_SendMoneyViewState> get copyWith => __$SendMoneyViewStateCopyWithImpl<_SendMoneyViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendMoneyViewState&&(identical(other.formKey, formKey) || other.formKey == formKey)&&(identical(other.amountController, amountController) || other.amountController == amountController)&&(identical(other.recipientController, recipientController) || other.recipientController == recipientController)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,formKey,amountController,recipientController,isLoading,isSuccess,errorMessage);

@override
String toString() {
  return 'SendMoneyViewState(formKey: $formKey, amountController: $amountController, recipientController: $recipientController, isLoading: $isLoading, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SendMoneyViewStateCopyWith<$Res> implements $SendMoneyViewStateCopyWith<$Res> {
  factory _$SendMoneyViewStateCopyWith(_SendMoneyViewState value, $Res Function(_SendMoneyViewState) _then) = __$SendMoneyViewStateCopyWithImpl;
@override @useResult
$Res call({
 GlobalKey<FormState> formKey, TextEditingController amountController, TextEditingController recipientController, bool isLoading, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class __$SendMoneyViewStateCopyWithImpl<$Res>
    implements _$SendMoneyViewStateCopyWith<$Res> {
  __$SendMoneyViewStateCopyWithImpl(this._self, this._then);

  final _SendMoneyViewState _self;
  final $Res Function(_SendMoneyViewState) _then;

/// Create a copy of SendMoneyViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? formKey = null,Object? amountController = null,Object? recipientController = null,Object? isLoading = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_SendMoneyViewState(
formKey: null == formKey ? _self.formKey : formKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormState>,amountController: null == amountController ? _self.amountController : amountController // ignore: cast_nullable_to_non_nullable
as TextEditingController,recipientController: null == recipientController ? _self.recipientController : recipientController // ignore: cast_nullable_to_non_nullable
as TextEditingController,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
