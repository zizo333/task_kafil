import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task/core/enums/request_state.dart';
import 'package:task/core/enums/user_type.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

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
  final formKey = GlobalKey<FormState>();

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
    return super.close();
  }
}
