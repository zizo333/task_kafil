class ApiConstants {
  const ApiConstants._();

  static const appDependencies = '/api/test/dependencies';

  static const String applicationJson = 'application/json';
  static const String accept = 'Accept';
  static const String contentType = 'Content-Type';
  static const String acceptLanguage = 'Accept-Language';
  static Map<String, String> authorization(String token) =>
      {'Authorization': 'Bearer $token'};

  static Map<String, String> headers([
    Map<String, String>? additionalHeaders,
  ]) =>
      {
        ...{
          accept: applicationJson,
          contentType: applicationJson,
          acceptLanguage: 'en',
        },
        ...additionalHeaders ?? {},
      };
}
