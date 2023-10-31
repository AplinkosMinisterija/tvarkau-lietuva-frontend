import 'dart:convert';
import 'package:dio/dio.dart';

class ApiQuery {
  final String endpointPostfix;
  final Map<String, dynamic>? params;
  final Map<String, dynamic>? body;

  String get jsonEncodedBody => jsonEncode(body);

  FormData? get formDataBody => body != null ? FormData.fromMap(body!) : null;

  ApiQuery({
    required this.endpointPostfix,
    required this.body,
    required this.params,
  });
}

class ApiQueryWithFormData {
  final Map<String, dynamic>? params;
  final FormData? body;
  final String endpointPostfix;

  ApiQueryWithFormData({
    required this.endpointPostfix,
    required this.params,
    required this.body,
  });
}
