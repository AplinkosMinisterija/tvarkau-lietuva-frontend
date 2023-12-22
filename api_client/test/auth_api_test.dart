import 'package:test/test.dart';
import 'package:api_client/api_client.dart';

/// tests for AuthApi
void main() {
  final instance = ApiClient().getAuthApi();

  group(AuthApi, () {
    //Future<LogInDto> authControllerLogin(LoginRequestDto loginRequestDto) async
    test('test authControllerLogin', () async {
      // TODO
    });
  });
}
