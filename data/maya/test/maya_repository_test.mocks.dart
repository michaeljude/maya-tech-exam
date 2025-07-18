// Mocks generated by Mockito 5.4.6 from annotations
// in data_maya/test/maya_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:data_json_serializable/data_json_serializable.dart' as _i4;
import 'package:data_maya/src/maya_api_repository.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [MayaApiRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMayaApiRepository extends _i1.Mock implements _i2.MayaApiRepository {
  MockMayaApiRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> signIn({
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#signIn, [], {
              #email: email,
              #password: password,
            }),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);

  @override
  _i3.Future<List<_i4.AuthenticationDto>> getUsers() =>
      (super.noSuchMethod(
            Invocation.method(#getUsers, []),
            returnValue: _i3.Future<List<_i4.AuthenticationDto>>.value(
              <_i4.AuthenticationDto>[],
            ),
          )
          as _i3.Future<List<_i4.AuthenticationDto>>);

  @override
  _i3.Future<void> sendMoney({
    required double? amount,
    required String? recipient,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#sendMoney, [], {
              #amount: amount,
              #recipient: recipient,
            }),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);

  @override
  _i3.Future<void> logout() =>
      (super.noSuchMethod(
            Invocation.method(#logout, []),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);
}
