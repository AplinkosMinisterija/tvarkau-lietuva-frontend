import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;


class ApiProviderBase {
  final String _baseUrl;

  final Dio _dio = Dio();

  ApiProviderBase({
    required String baseUrl,
  })  : _baseUrl = baseUrl {
    _setupDio(
      dio: _dio,
      baseUrl: baseUrl,
    );
  }


  Future<http.Response> baseHttpRequest({
    required String url,
    required Map<String, String> headers,
    Map<String, String>? body,
  }) async {
    try {
      final http.Response response =
          await http.put(Uri.parse('$_baseUrl$url'), headers: headers, body: body);
      return response;
    } catch (e) {
      throw Exception();
    }
  }


  String token = '';

  void _setupDio({
    required Dio dio,
    required String baseUrl,
  }) {
    dio.options.baseUrl = baseUrl;
  }
}
