import 'package:data/errors/http_errors/error_handler.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../../queries/api_query.dart';

class ApiProviderBase {
  final String _baseUrl;
  final ErrorHandler _errorHandler;

  final Dio _dio = Dio();

  ApiProviderBase({
    required String baseUrl,
    required ErrorHandler errorHandler,
  })  : _baseUrl = baseUrl,
        _errorHandler = errorHandler {
    _setupDio(
      dio: _dio,
      baseUrl: baseUrl,
    );
  }

  Future<dynamic> get<T>(
    Function? parse,
    ApiQuery query,
  ) async {
    return safeRequest(() async {
      final Response<dynamic> response = await _dio.get(
        query.endpointPostfix,
        queryParameters: query.params,
      );

      return parse != null ? parse(response.data!) : response.data!;
    });
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

  Future<dynamic> post<T>(
    Function? parse,
    ApiQuery query, {
    bool isFormData = false,
  }) async {
    return safeRequest(() async {
      final Response<dynamic> response = await _dio.post(
        query.endpointPostfix,
        data: isFormData ? query.formDataBody : query.jsonEncodedBody,
        queryParameters: query.params,
      );
      if (parse != null) {
        return parse(response.data!);
      }

      return response.data!;
    });
  }

  Future<Response<dynamic>> getWithFullResponse<T>(
    ApiQuery query, {
    bool isFormData = false,
  }) async {
    return safeRequest(
      () async {
        final Response<dynamic> response = await _dio.get(
          query.endpointPostfix,
          queryParameters: query.params,
        );

        return response;
      },
    );
  }

  Future<Response<dynamic>> postWithFullResponse<T>(
    ApiQuery query, {
    bool isFormData = false,
    Options? options,
  }) async {
    return safeRequest(
      () async {
        final Response<dynamic> response = await _dio.post(
          query.endpointPostfix,
          data: isFormData ? query.formDataBody : query.jsonEncodedBody,
          queryParameters: query.params,
          options: options,
        );
        return response;
      },
    );
  }

  Future<void> put(ApiQuery query) async {
    return safeRequest(() async {
      await _dio.put(
        query.endpointPostfix,
        data: query.body,
        queryParameters: query.params,
      );
    });
  }

  Future<void> patch(ApiQuery query) async {
    return safeRequest(() async {
      await _dio.patch(
        query.endpointPostfix,
        data: query.body,
        queryParameters: query.params,
      );
    });
  }

  Future<void> delete(ApiQuery query) async {
    return safeRequest(() async {
      await _dio.delete(
        query.endpointPostfix,
        data: query.body,
        queryParameters: query.params,
      );
    });
  }

  Future<T> safeRequest<T>(Future<T> Function() request) async {
    try {
      return await request();
    } on DioError catch (e) {
      print(e);
      //TODO: return dialog page here with error info
      return _errorHandler.handleError(e);
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
