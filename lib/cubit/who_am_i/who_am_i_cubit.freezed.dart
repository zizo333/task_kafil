// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'who_am_i_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WhoAmIState {
  UserTypeModel? get userType => throw _privateConstructorUsedError;
  File? get userImage => throw _privateConstructorUsedError;
  DateTime? get birthDate => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  bool get isFirstForm => throw _privateConstructorUsedError;
  List<SocialMedia> get socialMedia => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WhoAmIStateCopyWith<WhoAmIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WhoAmIStateCopyWith<$Res> {
  factory $WhoAmIStateCopyWith(
          WhoAmIState value, $Res Function(WhoAmIState) then) =
      _$WhoAmIStateCopyWithImpl<$Res, WhoAmIState>;
  @useResult
  $Res call(
      {UserTypeModel? userType,
      File? userImage,
      DateTime? birthDate,
      Gender gender,
      bool isFirstForm,
      List<SocialMedia> socialMedia,
      List<String> skills});
}

/// @nodoc
class _$WhoAmIStateCopyWithImpl<$Res, $Val extends WhoAmIState>
    implements $WhoAmIStateCopyWith<$Res> {
  _$WhoAmIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userType = freezed,
    Object? userImage = freezed,
    Object? birthDate = freezed,
    Object? gender = null,
    Object? isFirstForm = null,
    Object? socialMedia = null,
    Object? skills = null,
  }) {
    return _then(_value.copyWith(
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserTypeModel?,
      userImage: freezed == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as File?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      isFirstForm: null == isFirstForm
          ? _value.isFirstForm
          : isFirstForm // ignore: cast_nullable_to_non_nullable
              as bool,
      socialMedia: null == socialMedia
          ? _value.socialMedia
          : socialMedia // ignore: cast_nullable_to_non_nullable
              as List<SocialMedia>,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WhoAmIStateImplCopyWith<$Res>
    implements $WhoAmIStateCopyWith<$Res> {
  factory _$$WhoAmIStateImplCopyWith(
          _$WhoAmIStateImpl value, $Res Function(_$WhoAmIStateImpl) then) =
      __$$WhoAmIStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserTypeModel? userType,
      File? userImage,
      DateTime? birthDate,
      Gender gender,
      bool isFirstForm,
      List<SocialMedia> socialMedia,
      List<String> skills});
}

/// @nodoc
class __$$WhoAmIStateImplCopyWithImpl<$Res>
    extends _$WhoAmIStateCopyWithImpl<$Res, _$WhoAmIStateImpl>
    implements _$$WhoAmIStateImplCopyWith<$Res> {
  __$$WhoAmIStateImplCopyWithImpl(
      _$WhoAmIStateImpl _value, $Res Function(_$WhoAmIStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userType = freezed,
    Object? userImage = freezed,
    Object? birthDate = freezed,
    Object? gender = null,
    Object? isFirstForm = null,
    Object? socialMedia = null,
    Object? skills = null,
  }) {
    return _then(_$WhoAmIStateImpl(
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserTypeModel?,
      userImage: freezed == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as File?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      isFirstForm: null == isFirstForm
          ? _value.isFirstForm
          : isFirstForm // ignore: cast_nullable_to_non_nullable
              as bool,
      socialMedia: null == socialMedia
          ? _value._socialMedia
          : socialMedia // ignore: cast_nullable_to_non_nullable
              as List<SocialMedia>,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$WhoAmIStateImpl implements _WhoAmIState {
  const _$WhoAmIStateImpl(
      {this.userType,
      this.userImage = null,
      this.birthDate = null,
      this.gender = Gender.male,
      this.isFirstForm = true,
      final List<SocialMedia> socialMedia = const [
        SocialMedia.facebook,
        SocialMedia.twitter
      ],
      final List<String> skills = const []})
      : _socialMedia = socialMedia,
        _skills = skills;

  @override
  final UserTypeModel? userType;
  @override
  @JsonKey()
  final File? userImage;
  @override
  @JsonKey()
  final DateTime? birthDate;
  @override
  @JsonKey()
  final Gender gender;
  @override
  @JsonKey()
  final bool isFirstForm;
  final List<SocialMedia> _socialMedia;
  @override
  @JsonKey()
  List<SocialMedia> get socialMedia {
    if (_socialMedia is EqualUnmodifiableListView) return _socialMedia;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_socialMedia);
  }

  final List<String> _skills;
  @override
  @JsonKey()
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  String toString() {
    return 'WhoAmIState(userType: $userType, userImage: $userImage, birthDate: $birthDate, gender: $gender, isFirstForm: $isFirstForm, socialMedia: $socialMedia, skills: $skills)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WhoAmIStateImpl &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.isFirstForm, isFirstForm) ||
                other.isFirstForm == isFirstForm) &&
            const DeepCollectionEquality()
                .equals(other._socialMedia, _socialMedia) &&
            const DeepCollectionEquality().equals(other._skills, _skills));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      userType,
      userImage,
      birthDate,
      gender,
      isFirstForm,
      const DeepCollectionEquality().hash(_socialMedia),
      const DeepCollectionEquality().hash(_skills));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WhoAmIStateImplCopyWith<_$WhoAmIStateImpl> get copyWith =>
      __$$WhoAmIStateImplCopyWithImpl<_$WhoAmIStateImpl>(this, _$identity);
}

abstract class _WhoAmIState implements WhoAmIState {
  const factory _WhoAmIState(
      {final UserTypeModel? userType,
      final File? userImage,
      final DateTime? birthDate,
      final Gender gender,
      final bool isFirstForm,
      final List<SocialMedia> socialMedia,
      final List<String> skills}) = _$WhoAmIStateImpl;

  @override
  UserTypeModel? get userType;
  @override
  File? get userImage;
  @override
  DateTime? get birthDate;
  @override
  Gender get gender;
  @override
  bool get isFirstForm;
  @override
  List<SocialMedia> get socialMedia;
  @override
  List<String> get skills;
  @override
  @JsonKey(ignore: true)
  _$$WhoAmIStateImplCopyWith<_$WhoAmIStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
