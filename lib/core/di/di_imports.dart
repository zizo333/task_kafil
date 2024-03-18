import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task/core/enums/enums.dart';
import 'package:task/core/networking/api_service.dart';
import 'package:task/core/networking/dio_factory.dart';
import 'package:task/core/networking/network_info.dart';
import 'package:task/cubit/nav/nav_cubit.dart';
import 'package:task/cubit/register/register_cubit.dart';
import 'package:task/cubit/login/login_cubit.dart';
import 'package:task/cubit/splash/splash_cubit.dart';
import 'package:task/cubit/who_am_i/who_am_i_cubit.dart';
import 'package:task/data/datasources/app_remote_data_source.dart';
import 'package:task/data/models/user_type_model.dart';
import 'package:task/data/repos/app_repo.dart';
import 'package:task/data/repos/user_repo.dart';

part 'di.dart';
