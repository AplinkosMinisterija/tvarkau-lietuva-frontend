import 'package:api_client/api_client.dart';
import 'package:built_collection/built_collection.dart';
import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

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

  static get _publicClient => ApiClient(
        basePathOverride: GlobalConstants.basePath,
      );

  static get _adminClient => ApiClient(
        basePathOverride: GlobalConstants.basePath,
        interceptors: [
          InterceptorsWrapper(
            onRequest: (RequestOptions options,
                RequestInterceptorHandler handler) async {
              final authKey = await SecureStorageProvider().getJwtToken();
              if (authKey != null) {
                options.headers['Authorization'] = 'Bearer $authKey';
              } else {
                throw Exception('No auth key found');
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

  Future<List<FullReportDto>> getAllTrashReports() async {
    final response = await adminApi.adminControllerGetAllReports(
      isDeleted: false,
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

  Future<PublicReportDto> getOneTrashReport(String refId) async {
    final response =
        await reportsApi.reportControllerGetReportById(refId: int.parse(refId));
    return response.data!;
  }

  Future<List<FullReportDto>> getAllRemovedReports() async {
    final response = await adminApi.adminControllerGetAllReports(
      isDeleted: true,
    );
    return response.data!.toList();
  }

  Future<List<PublicReportDto>> getAllVisibleTrashReports() async {
    final response = await reportsApi.reportControllerGetAllPublicReports();
    return response.data!.toList(); //TODO: add error handling
  }

  Future<ReportStatisticsDto> getReportStatistics() async {
    final response = await reportsApi.reportControllerGetReportStatistics();
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
  }) async {
    final response = await reportsApi.reportControllerCreateNewReport(
        name: textValue,
        longitude: selectedLong,
        latitude: selectedLat,
        email: emailValue,
        images: _toMultiPartFiles(imageFiles));
    return response.data!;
  }

  Future<FullReportDto> updateTrashReport({
    required String id,
    required String refId,
    required String name,
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
        updateDumpDto: UpdateDumpDto((builder) => {
              builder.id = id,
              builder.address = address,
              builder.longitude = longitude,
              builder.latitude = latitude,
              builder.name = name,
              builder.moreInformation = moreInformation,
              builder.workingHours = workingHours,
              builder.phone = phone,
              builder.isVisible = isVisible,
            }));
    return response.data!;
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
