import 'package:core/errors/app_exception.dart';
import 'package:core/utils/report_text.dart';
import 'package:core/utils/report_text_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  DioException responseError(int status, Object message) {
    final request = RequestOptions(path: '/admin/reports/transfer');
    return DioException(
      requestOptions: request,
      response: Response(
        requestOptions: request,
        statusCode: status,
        data: {'message': message},
      ),
      type: DioExceptionType.badResponse,
    );
  }

  test('recognizes the local report limit before making an API request', () {
    expect(reportTextErrorMessage(AppException(ReportText.tooLongMessage)),
        ReportText.tooLongMessage);
  });

  test('recognizes NestJS string and list validation responses', () {
    for (final status in [400, 422]) {
      expect(
          reportTextErrorMessage(
              responseError(status, ReportText.tooLongMessage)),
          ReportText.tooLongMessage);
      expect(
          reportTextErrorMessage(
              responseError(status, [ReportText.tooLongMessage])),
          ReportText.tooLongMessage);
    }
  });

  test('does not expose unrelated backend errors to the user', () {
    expect(
        reportTextErrorMessage(responseError(400, 'Internal details')), isNull);
    expect(
        reportTextErrorMessage(responseError(500, ReportText.tooLongMessage)),
        isNull);
    expect(reportTextErrorMessage(Exception('network failure')), isNull);
  });
}
