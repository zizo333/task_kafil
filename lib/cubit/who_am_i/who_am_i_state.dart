part of 'who_am_i_cubit.dart';

@freezed
class WhoAmIState with _$WhoAmIState {
  const factory WhoAmIState({
    @Default(UserType.seller) UserType userType,
    @Default(null) File? userImage,
    @Default(null) DateTime? birthDate,
    @Default(Gender.male) Gender gender,
    @Default(true) bool isFirstForm,
    @Default([SocialMedia.facebook, SocialMedia.twitter])
    List<SocialMedia> socialMedia,
    @Default([]) List<String> skills,
  }) = _WhoAmIState;
}
