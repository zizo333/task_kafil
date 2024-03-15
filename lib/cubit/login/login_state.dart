part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(RequestState.none) RequestState submitLogin,
    @Default('') String message,
    @Default(true) bool isRememberMeSelected,
    @Default(AutovalidateMode.disabled) AutovalidateMode autovalidateMode,
  }) = _LoginState;
}
