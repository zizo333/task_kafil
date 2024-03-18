part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(RequestState.none) RequestState submitState,
    @Default('') String message,
    @Default(AutovalidateMode.disabled) AutovalidateMode autovalidateMode,
    UserTypeModel? userType,
    @Default(null) File? userImage,
    @Default(null) DateTime? birthDate,
    @Default(Gender.male) Gender gender,
    @Default(StepNumber.step1) StepNumber stepNumber,
    @Default([SocialMedia.facebook, SocialMedia.twitter])
    List<SocialMedia> socialMedia,
    @Default([]) List<String> skills,
  }) = _RegisterState;

  factory RegisterState.init() {
    final userTypes = sl<UserTypes>().userTpes;
    return RegisterState(userType: userTypes.isEmpty ? null : userTypes.first);
  }
}
