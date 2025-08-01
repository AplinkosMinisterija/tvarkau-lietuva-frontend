import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_client/api_client.dart';
import 'package:built_collection/built_collection.dart';
import 'package:core/core.dart';
import 'package:core/utils/permit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import 'package:sentry_dio/sentry_dio.dart';
import 'package:go_router/go_router.dart';
import 'navigation_service.dart';

class ApiProvider {
  ApiProvider._(
      {required ApiClient publicClient, required ApiClient adminClient})
      : adminApi = adminClient.getAdminApi(),
        dumpsApi = publicClient.getDumpsApi(),
        reportsApi = publicClient.getReportsApi(),
        authApi = publicClient.getAuthApi();

  static final ApiProvider _instance = ApiProvider._(
    publicClient: _publicClient,
    adminClient: _adminClient,
  );

  static Dio get _dio => Dio(
        BaseOptions(
          baseUrl: GlobalConstants.basePath,
          connectTimeout: const Duration(milliseconds: 30000),
          receiveTimeout: const Duration(milliseconds: 30000),
        ),
      )..addSentry();

  static ApiClient get _publicClient => ApiClient(dio: _dio);

  static ApiClient get _adminClient => ApiClient(
        dio: _dio,
        interceptors: [
          InterceptorsWrapper(
            onRequest: (RequestOptions options,
                RequestInterceptorHandler handler) async {
              final authKey = await SecureStorageProvider().getJwtToken();
              if (authKey != null) {
                options.headers['Authorization'] = 'Bearer $authKey';
              } else {
                final context = navigatorKey.currentContext;
                if (context != null) {
                  Future.microtask(() {
                    context.goNamed('admin');
                  });
                }
                throw DioException(
                    message: 'Authorization error', requestOptions: options);
              }
              return handler.next(options);
            },
          ),
          if (kDebugMode) LogInterceptor(responseBody: false)
        ],
      );

  factory ApiProvider() => _instance;

  final DumpsApi dumpsApi;

  final ReportsApi reportsApi;

  final AdminApi adminApi;

  final AuthApi authApi;

  Future<List<FullReportDto>> getAllTrashReports(String? category) async {
    final response = await adminApi.adminControllerGetAllReports(
      isDeleted: false,
      category: category,
    );
    return response.data!.toList();
  }

  Future<FullReportDto> getFullTrashReportById(String refId) async {
    final response = await adminApi.adminControllerGetReportById(
      refId: int.parse(refId),
    );
    return response.data!;
  }

  Future<FullDumpDto> getFullDumpReportById(String refId) async {
    final response = await adminApi.adminControllerGetDumpById(
      refId: refId,
    );
    return response.data!;
  }

  Future<PublicReportDto?> getOneTrashReport(String refId) async {
    int? refValue = int.tryParse(refId);
    if (refValue == null) {
      return null;
    }
    final response =
        await reportsApi.reportControllerGetReportById(refId: refValue);
    if (response.statusCode == 404) {
      return null;
    } else {
      return response.data!;
    }
  }

  Future<List<FullReportDto>> getAllRemovedReports(String? category) async {
    final response = await adminApi.adminControllerGetAllReports(
      isDeleted: true,
      category: category,
    );
    return response.data!.toList();
  }

  Future<List<PublicReportDto>> getAllVisibleReports(String? category) async {
    final response = await reportsApi.reportControllerGetAllPublicReports(
        category: category);
    return response.data!.toList();
  }

  Future<ReportStatisticsDto> getReportStatistics(String? category) async {
    final response = await reportsApi.reportControllerGetReportStatistics(
        category: category);
    return response.data!;
  }

  Future<List<FullDumpDto>> getAllDumpReports() async {
    final response = await adminApi.adminControllerGetAllDumps();
    return response.data!.toList();
  }

  Future<List<DumpDto>> getAllVisibleDumpReports() {
    return dumpsApi
        .dumpControllerGetAllVisibleDumps()
        .then((r) => r.data!.toList());
  }

  Future<LogInDto> getUserInfo(String accessToken) async {
    final response = await authApi.authControllerLogin(
        loginRequestDto:
            LoginRequestDto((builder) => builder.accessKey = accessToken));
    return response.data!;
  }

  Future<PublicReportDto> sendNewTrashReport({
    required String emailValue,
    required String textValue,
    required double selectedLat,
    required double selectedLong,
    required List<Uint8List> imageFiles,
    required String category,
    required bool automaticEmailsEnabled,
  }) async {
    final response = await reportsApi.reportControllerCreateNewReport(
      name: textValue,
      longitude: selectedLong,
      latitude: selectedLat,
      email: emailValue,
      images: _toMultiPartFiles(imageFiles),
      category: category,
      automaticEmailsEnabled: automaticEmailsEnabled,
    );
    return response.data!;
  }

  Future<TransferReportDto> transferTrashReport({
    required String refId,
    required String name,
    required double longitude,
    required double latitude,
    required String status,
    required DateTime reportDate,
    required String email,
  }) async {
    final response = await adminApi.adminControllerTransferReport(
        transferReportDto: TransferReportDto((builder) {
      builder.refId = refId;
      builder.name = name;
      builder.longitude = longitude;
      builder.latitude = latitude;
      builder.status = status;
      builder.reportDate = reportDate;
      builder.email = email;
    }));
    return response.data!;
  }

  Future<FullReportDto> updateTrashReport({
    required String id,
    required String refId,
    required String name,
    required String category,
    required double reportLong,
    required double reportLat,
    required String status,
    required String comment,
    required bool isVisible,
    required bool isDeleted,
    required List<String> imageUrls,
    required List<String> officerImageUrls,
    required List<Uint8List> officerImageFiles,
  }) async {
    final response = await adminApi.adminControllerUpdateReport(
        refId: refId,
        name: name,
        category: category,
        longitude: reportLong,
        latitude: reportLat,
        isVisible: isVisible,
        isDeleted: isDeleted,
        comment: comment,
        status: status,
        officerImageUrls: officerImageUrls.toBuiltList(),
        imageUrls: imageUrls.toBuiltList(),
        images: _toMultiPartFiles(officerImageFiles));
    return response.data!;
  }

  Future<FullDumpDto> updateDumpReport({
    required String id,
    required String name,
    required double longitude,
    required double latitude,
    required String address,
    required String moreInformation,
    required String workingHours,
    required String phone,
    required bool isVisible,
  }) async {
    final response = await adminApi.adminControllerUpdateDump(
        updateDumpDto: UpdateDumpDto((builder) {
      builder.id = id;
      builder.address = address;
      builder.longitude = longitude;
      builder.latitude = latitude;
      builder.name = name;
      builder.moreInformation = moreInformation;
      builder.workingHours = workingHours;
      builder.phone = phone;
      builder.isVisible = isVisible;
    }));
    return response.data!;
  }

  Future<String> sendFeedbackReport({
    required String email,
    required String description,
    List<Uint8List>? imageFiles,
  }) async {
    BuiltList<MultipartFile>? images;
    if(imageFiles != null){
      images = _toMultiPartFiles(imageFiles);
    }

    final response = await reportsApi.reportControllerSendFeedbackReport(
      images: images,
      description: description,
      email: email,
    );
    return response.data!;
  }

  Future<List<Permit>> getVisiblePermits({
    required double minLat,
    required double minLong,
    required double maxLat,
    required double maxLong,
  }) async {
    final response = await http
        .post(Uri.parse('${GlobalConstants.basePath}/reports/geojson'), body: {
      "minLat": minLat.toString(),
      "maxLat": maxLat.toString(),
      "minLong": minLong.toString(),
      "maxLong": maxLong.toString(),
    });
    List<dynamic> featuresList = jsonDecode(response.body);
    List<Permit> permits = featuresList
        .map((featureItem) => Permit.fromJson(featureItem))
        .toList();
    return permits;
  }

  BuiltList<MultipartFile> _toMultiPartFiles(List<Uint8List> files) {
    return files.mapIndexed((index, bytes) {
      final mime = lookupMimeType('', headerBytes: bytes) ?? 'image/jpeg';
      final extension = extensionFromMime(mime);

      return MultipartFile.fromBytes(
        bytes,
        filename: '${index + 1}.$extension',
        contentType: MediaType.parse(mime),
      );
    }).toBuiltList();
  }
}
