// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginState {
  RequestState get submitLogin => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get isRememberMeSelected => throw _privateConstructorUsedError;
  AutovalidateMode get autovalidateMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {RequestState submitLogin,
      String message,
      bool isRememberMeSelected,
      AutovalidateMode autovalidateMode});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? submitLogin = null,
    Object? message = null,
    Object? isRememberMeSelected = null,
    Object? autovalidateMode = null,
  }) {
    return _then(_value.copyWith(
      submitLogin: null == submitLogin
          ? _value.submitLogin
          : submitLogin // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isRememberMeSelected: null == isRememberMeSelected
          ? _value.isRememberMeSelected
          : isRememberMeSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      autovalidateMode: null == autovalidateMode
          ? _value.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState submitLogin,
      String message,
      bool isRememberMeSelected,
      AutovalidateMode autovalidateMode});
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? submitLogin = null,
    Object? message = null,
    Object? isRememberMeSelected = null,
    Object? autovalidateMode = null,
  }) {
    return _then(_$LoginStateImpl(
      submitLogin: null == submitLogin
          ? _value.submitLogin
          : submitLogin // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isRememberMeSelected: null == isRememberMeSelected
          ? _value.isRememberMeSelected
          : isRememberMeSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      autovalidateMode: null == autovalidateMode
          ? _value.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl implements _LoginState {
  const _$LoginStateImpl(
      {this.submitLogin = RequestState.none,
      this.message = '',
      this.isRememberMeSelected = true,
      this.autovalidateMode = AutovalidateMode.disabled});

  @override
  @JsonKey()
  final RequestState submitLogin;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final bool isRememberMeSelected;
  @override
  @JsonKey()
  final AutovalidateMode autovalidateMode;

  @override
  String toString() {
    return 'LoginState(submitLogin: $submitLogin, message: $message, isRememberMeSelected: $isRememberMeSelected, autovalidateMode: $autovalidateMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.submitLogin, submitLogin) ||
                other.submitLogin == submitLogin) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isRememberMeSelected, isRememberMeSelected) ||
                other.isRememberMeSelected == isRememberMeSelected) &&
            (identical(other.autovalidateMode, autovalidateMode) ||
                other.autovalidateMode == autovalidateMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, submitLogin, message,
      isRememberMeSelected, autovalidateMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {final RequestState submitLogin,
      final String message,
      final bool isRememberMeSelected,
      final AutovalidateMode autovalidateMode}) = _$LoginStateImpl;

  @override
  RequestState get submitLogin;
  @override
  String get message;
  @override
  bool get isRememberMeSelected;
  @override
  AutovalidateMode get autovalidateMode;
  @override
  @JsonKey(ignore: true)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
