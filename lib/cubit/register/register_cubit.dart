import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task/core/di/di_imports.dart';
import 'package:task/core/enums/enums.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/data/models/user_type_model.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState.init());

  final firstNameController = TextEditingController();
  final firstNameNode = FocusNode();
  final lastNameController = TextEditingController();
  final lastNameNode = FocusNode();
  final emailAddressController = TextEditingController();
  final emailAddressNode = FocusNode();
  final passwordController = TextEditingController();
  final passwordNode = FocusNode();
  final confirmPasswordController = TextEditingController();
  final confirmPasswordNode = FocusNode();
  final aboutController = TextEditingController();
  final aboutNode = FocusNode();
  final salaryController =
      TextEditingController(text: '${AppStrings.sar} 1000');
  final birthDateController = TextEditingController();
  final salaryNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  void changeStepNumber(StepNumber stepNumber) {
    emit(state.copyWith(stepNumber: stepNumber));
  }

  void changeUserImage(File userImage) {
    emit(state.copyWith(userImage: userImage));
  }

  void selectGender(Gender gender) {
    emit(state.copyWith(gender: gender));
  }

  void addSkill(String skill) {
    emit(state.copyWith(skills: [...state.skills, skill]));
  }

  void deleteSkill(String skill) {
    emit(state.copyWith(skills: [...state.skills]..remove(skill)));
  }

  void selectSocialMedia(SocialMedia socialMedia) {
    final sMedia = [...state.socialMedia];
    if (sMedia.contains(socialMedia)) {
      sMedia.remove(socialMedia);
    } else {
      sMedia.add(socialMedia);
    }
    emit(state.copyWith(socialMedia: sMedia));
  }

  bool isSelected(SocialMedia socialMedia) =>
      state.socialMedia.contains(socialMedia);

  @override
  Future<void> close() {
    firstNameController.dispose();
    firstNameNode.dispose();
    lastNameController.dispose();
    lastNameNode.dispose();
    emailAddressController.dispose();
    emailAddressNode.dispose();
    passwordController.dispose();
    passwordNode.dispose();
    confirmPasswordController.dispose();
    confirmPasswordNode.dispose();
    aboutController.dispose();
    aboutNode.dispose();
    salaryController.dispose();
    salaryNode.dispose();
    return super.close();
  }
}
