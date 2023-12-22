import 'package:test/test.dart';
import 'package:api_client/api_client.dart';

/// tests for DumpsApi
void main() {
  final instance = ApiClient().getDumpsApi();

  group(DumpsApi, () {
    //Future<BuiltList<DumpDto>> dumpControllerGetAllVisibleDumps() async
    test('test dumpControllerGetAllVisibleDumps', () async {
      // TODO
    });
  });
}
