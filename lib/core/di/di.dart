part of 'di_imports.dart';

final sl = GetIt.I;

Future<void> initInjection() async {
  await _initCore();
  await _initDataSoureces();
  await _initRepos();
  await _initCubits();
}

Future<void> _initCore() async {
  final dioFactory = await DioFactory.getDio();

  sl
    ..registerLazySingleton(InternetConnectionChecker.new)
    ..registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()))
    ..registerLazySingleton(() => dioFactory)
    ..registerLazySingleton(() => ApiService(dio: sl(), networkInfo: sl()))
    ..registerLazySingleton(UserTypes.new);
}

Future<void> _initDataSoureces() async {
  sl.registerLazySingleton(() => AppRemoteDataSource(sl()));
}

Future<void> _initRepos() async {
  sl
    ..registerLazySingleton(() => AppRepo(sl()))
    ..registerLazySingleton(() => const UserRepo());
}

Future<void> _initCubits() async {
  sl
    ..registerFactory(() => SplashCubit(sl()))
    ..registerFactory(LoginCubit.new)
    ..registerFactory(
      RegisterCubit.new,
    )
    ..registerFactory(NavCubit.new)
    ..registerFactory(WhoAmICubit.new);
}
