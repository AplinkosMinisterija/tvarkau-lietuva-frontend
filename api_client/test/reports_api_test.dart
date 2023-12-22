import 'package:test/test.dart';
import 'package:api_client/api_client.dart';

/// tests for ReportsApi
void main() {
  final instance = ApiClient().getReportsApi();

  group(ReportsApi, () {
    //Future<PublicReportDto> reportControllerCreateNewReport(String name, num longitude, num latitude, String email, BuiltList<MultipartFile> images) async
    test('test reportControllerCreateNewReport', () async {
      // TODO
    });

    //Future<BuiltList<PublicReportDto>> reportControllerGetAllPublicReports() async
    test('test reportControllerGetAllPublicReports', () async {
      // TODO
    });

    //Future<PublicReportDto> reportControllerGetReportById(num refId) async
    test('test reportControllerGetReportById', () async {
      // TODO
    });
  });
}
