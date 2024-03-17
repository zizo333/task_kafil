import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/di/di_imports.dart';
import 'package:task/cubit/nav/nav_cubit.dart';

final providers = [
  BlocProvider<NavCubit>(create: (_) => sl<NavCubit>()),
];
