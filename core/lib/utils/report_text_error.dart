import 'package:dio/dio.dart';

import '../errors/app_exception.dart';
import 'report_text.dart';

/// Only exposes the known report validation message, not arbitrary API errors.
String? reportTextErrorMessage(Object error) {
  if (error is AppException &&
      error.errorMessage == ReportText.tooLongMessage) {
    return ReportText.tooLongMessage;
  }
  if (error is DioException &&
      (error.response?.statusCode == 400 ||
          error.response?.statusCode == 422)) {
    final data = error.response?.data;
    final message = data is Map ? data['message'] : null;
    if (message == ReportText.tooLongMessage ||
        (message is List && message.contains(ReportText.tooLongMessage))) {
      return ReportText.tooLongMessage;
    }
  }
  return null;
}
