import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task/core/di/di_imports.dart';
import 'package:task/core/helpers/environment.dart';
import 'package:task/core/helpers/my_bloc_observer.dart';
import 'package:task/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await AppFunctions.setPreferredOrientations();
  await Environment.loadEnv();
  await initInjection();

  if (kDebugMode) {
    Bloc.observer = MyBlocObserver();
  }

  runApp(
    const MyApp(),
  );
}
