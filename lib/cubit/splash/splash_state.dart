part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;
  const factory SplashState.loading() = _Loading;
  const factory SplashState.loaded(List<UserTypeModel> userTypes) = Loaded;
  const factory SplashState.error(String message) = _Error;
}
