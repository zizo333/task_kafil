import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  const Environment._();

  static Future<void> loadEnv() async => dotenv.load();

  static String get baseUrl => dotenv.env['BASE_URL'] ?? 'BASE_URL not found!';
}
