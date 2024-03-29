part of 'app_router_imports.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final arguments = settings.arguments;
  final routeName = settings.name;

  switch (routeName) {
    // case '/':
    case Routes.splashScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider<SplashCubit>(
          create: (_) => sl<SplashCubit>()..fetchUserTypes(),
          child: const SplashScreen(),
        ),
      );
    case '/':
    case Routes.loginScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider<LoginCubit>(
          create: (_) => sl<LoginCubit>(),
          child: const LoginScreen(),
        ),
      );
    case Routes.registerScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider<RegisterCubit>(
          create: (context) => sl<RegisterCubit>(),
          child: const RegisterScreen(),
        ),
      );
    case Routes.navScreen:
      return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider<WhoAmICubit>(create: (_) => sl<WhoAmICubit>()),
          ],
          child: const NavScreen(),
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for $routeName'),
          ),
        ),
      );
  }
}
