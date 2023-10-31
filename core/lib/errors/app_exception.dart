class AppException implements Exception {
  static const String undefinedError = 'undefined error';

  final String errorMessage;

  AppException(this.errorMessage);
}
