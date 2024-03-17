part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(RequestState.none) RequestState submitState,
    @Default('') String message,
    @Default(AutovalidateMode.disabled) AutovalidateMode autovalidateMode,
    @Default(UserType.seller) UserType userType,
    @Default(null) File? userImage,
    @Default(null) DateTime? birthDate,
    @Default(Gender.male) Gender gender,
    @Default(true) bool isFirstForm,
    @Default([SocialMedia.facebook, SocialMedia.twitter])
    List<SocialMedia> socialMedia,
    @Default([]) List<String> skills,
  }) = _RegisterState;
}
