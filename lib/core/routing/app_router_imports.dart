import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/di/di_imports.dart';
import 'package:task/core/routing/routes.dart';
import 'package:task/cubit/register/register_cubit.dart';
import 'package:task/cubit/login/login_cubit.dart';
import 'package:task/cubit/splash/splash_cubit.dart';
import 'package:task/cubit/who_am_i/who_am_i_cubit.dart';
import 'package:task/ui/screens/auth/register_screen.dart';
import 'package:task/ui/screens/auth/login_screen.dart';
import 'package:task/ui/screens/nav/nav_screen.dart';
import 'package:task/ui/screens/splash/splash_screen.dart';

part 'app_router.dart';
