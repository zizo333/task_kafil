import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task/core/enums/enums.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  final emailAddressController = TextEditingController();
  final emailAddressNode = FocusNode();
  final passwordController = TextEditingController();
  final passwordNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  Future<void> close() {
    emailAddressController.dispose();
    emailAddressNode.dispose();
    passwordController.dispose();
    passwordNode.dispose();

    return super.close();
  }
}
