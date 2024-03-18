import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  const NetworkInfo();

  Future<bool> get isConnected;
}

class NetworkInfoImpl extends NetworkInfo {
  const NetworkInfoImpl(this._internetConnectionChecker);

  final InternetConnectionChecker _internetConnectionChecker;

  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;
}
