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

  sl.registerLazySingleton(() => dioFactory);
}

Future<void> _initDataSoureces() async {}

Future<void> _initRepos() async {
  sl.registerLazySingleton(() => const UserRepo());
}

Future<void> _initCubits() async {
  sl
    ..registerFactory(LoginCubit.new)
    ..registerFactory(RegisterCubit.new)
    ..registerFactory(NavCubit.new)
    ..registerFactory(WhoAmICubit.new);
}
