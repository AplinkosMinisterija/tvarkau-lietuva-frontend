import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ErrorHandler {
  Future<Never> handleError(DioError error) async {
    final Response<dynamic>? response = error.response;

    if (response?.headers == null) {
      throw AppException('exceptions.no_internet');
    } else if (response == null) {
      throw AppException('exceptions.backend_exception');
    } else {
      final int? statusCode = response.statusCode;
      if (statusCode != null) {
        if (statusCode == 400) {
          //TODO: Add error parsing logic here
          throw AppException('exceptions.request_error');
        }

        if (statusCode == 401) {
          throw AppException('exceptions.auth_error');
        }
        if (statusCode == 403) {
          throw AppException('exceptions.forbidden_error');
        }
        if (statusCode == 404) {
          throw AppException('exceptions.not_found_error');
        }

        if (statusCode >= 500) {
          throw AppException('exceptions.backend_exception');
        }
      }

      throw Exception(error.toString());
    }
  }
}
