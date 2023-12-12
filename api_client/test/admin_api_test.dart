import 'package:test/test.dart';
import 'package:api_client/api_client.dart';

/// tests for AdminApi
void main() {
  final instance = ApiClient().getAdminApi();

  group(AdminApi, () {
    //Future<FullDumpDto> adminControllerCreateDump(String accessToken, CreateDumpDto createDumpDto) async
    test('test adminControllerCreateDump', () async {
      // TODO
    });

    //Future<BuiltList<FullDumpDto>> adminControllerGetAllDumps(String accessToken) async
    test('test adminControllerGetAllDumps', () async {
      // TODO
    });

    //Future<BuiltList<FullReportDto>> adminControllerGetAllReports(bool isDeleted, String accessToken) async
    test('test adminControllerGetAllReports', () async {
      // TODO
    });

    //Future<FullReportDto> adminControllerUpdateReport(String accessToken, String editor, String refId, String name, num longitude, num latitude, bool isVisible, bool isDeleted, String comment, String status, BuiltList<String> officerImageUrls, BuiltList<String> imageUrls, BuiltList<MultipartFile> images) async
    test('test adminControllerUpdateReport', () async {
      // TODO
    });
  });
}
