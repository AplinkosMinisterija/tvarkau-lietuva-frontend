import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:data/data.dart';
import 'package:dio/dio.dart' as dio;
import 'package:domain/domain.dart' as domain;
import 'package:core/core.dart';
import 'package:domain/report/report_library.dart';
import 'package:http/http.dart' as http2;
import 'package:openid_client/openid_client.dart';
import 'package:api_client/api_client.dart';

class ApiProvider {
  ApiProvider();

  final dumpsApi = ApiClient(basePathOverride: 'http://localhost:3000'
          //'https://stingray-app-d7ve9.ondigitalocean.app/tvarkau-lietuva-api2'
          )
      .getDumpsApi();

  final reportsApi = ApiClient(basePathOverride: 'http://localhost:3000'
          //'https://stingray-app-d7ve9.ondigitalocean.app/tvarkau-lietuva-api2'
          )
      .getReportsApi();

  final adminApi = ApiClient(basePathOverride: 'http://localhost:3000'
          // 'https://stingray-app-d7ve9.ondigitalocean.app/tvarkau-lietuva-api2'
          )
      .getAdminApi();

  final authApi = ApiClient(basePathOverride: 'http://localhost:3000'
          // 'https://stingray-app-d7ve9.ondigitalocean.app/tvarkau-lietuva-api2'
          )
      .getAuthApi();

  Future<List<FullReportDto>> getAllTrashReports() async {
    final String authKey = await SecureStorageProvider().getJwtToken();
    final response = await adminApi.adminControllerGetAllReports(
        isDeleted: false, authorization: authKey);
    return response.data!.toList();
  }

  Future<PublicReportDto> getOneTrashReport(String refId) async {
    final response =
        await reportsApi.reportControllerGetReportById(refId: int.parse(refId));
    return response.data!;
  }

  Future<List<FullReportDto>> getAllRemovedReports() async {
    final String authKey = await SecureStorageProvider().getJwtToken();
    final response = await adminApi.adminControllerGetAllReports(
        isDeleted: true, authorization: authKey);
    return response.data!.toList();
  }

  Future<List<PublicReportDto>> getAllVisibleTrashReports() async {
    final response = await reportsApi.reportControllerGetAllPublicReports();
    return response.data!.toList(); //TODO: add error handling
  }

  Future<List<FullDumpDto>> getAllDumpReports() async {
    String accessToken = await SecureStorageProvider().getJwtToken();
    final response =
        await adminApi.adminControllerGetAllDumps(authorization: accessToken);
    return response.data!.toList();
  }

  Future<List<DumpDto>> getAllVisibleDumpReports() async {
    final response = await dumpsApi.dumpControllerGetAllVisibleDumps();
    return response.data!.toList();
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
    required List<dio.MultipartFile> imageFiles,
  }) async {
    final response = await reportsApi.reportControllerCreateNewReport(
        name: textValue,
        longitude: selectedLong,
        latitude: selectedLat,
        email: emailValue,
        images: BuiltList(imageFiles));
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
    required String isVisible,
    required String isDeleted,
    required String editor,
    required List<String> imageUrls,
    required List<String> officerImageUrls,
    required List<dio.MultipartFile> officerImageFiles,
  }) async {
    final String authKey = await SecureStorageProvider().getJwtToken();

    final response = await adminApi.adminControllerUpdateReport(
        authorization: authKey,
        editor: editor,
        refId: refId,
        name: name,
        longitude: reportLong,
        latitude: reportLat,
        isVisible: isVisible == "true" ? true : false,
        isDeleted: isDeleted == "true" ? true : false,
        comment: comment,
        status: status,
        officerImageUrls: BuiltList(officerImageUrls),
        imageUrls: BuiltList(imageUrls),
        images: BuiltList(officerImageFiles));
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
    required String isVisible,
  }) async {
    final String authKey = await SecureStorageProvider().getJwtToken();

    final response = await adminApi.adminControllerUpdateDump(
        authorization: authKey,
        updateDumpDto: UpdateDumpDto((builder) => {
              builder.id = id,
              builder.address = address,
              builder.longitude = longitude,
              builder.latitude = latitude,
              builder.name = name,
              builder.moreInformation = moreInformation,
              builder.workingHours = workingHours,
              builder.phone = phone,
              builder.isVisible = isVisible == 'true' ? true : false,
            }));
    return response.data!;
  }
}
