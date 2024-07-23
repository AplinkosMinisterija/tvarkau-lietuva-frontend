import 'package:api_client/api_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageProvider {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  static const String _keyJwtKey = 'jwt_key';
  static const String _userEmailKey = 'user_email_key';
  static const String _userNameKey = 'user_name_key';

  setJwtToken(String jwtToken) async {
    await storage.write(
      key: _keyJwtKey,
      value: jwtToken,
    );
  }

  Future<String?> getJwtToken() {
    return storage.read(key: _keyJwtKey);
  }

  deleteJwtToken() async {
    await storage.delete(key: _keyJwtKey);
  }

  setUserInfo(LogInDto userInfo) async {
    await storage.write(
      key: _userEmailKey,
      value: userInfo.email,
    );
    await storage.write(
      key: _userNameKey,
      value: userInfo.name,
    );
  }

  deleteUserInfo(LogInDto userInfo) async {
    await storage.delete(
      key: _userEmailKey,
    );
    await storage.delete(
      key: _userNameKey,
    );
  }

  Future<LogInDto> getUserInfo() async {
    String? email = await storage.read(key: _userEmailKey);
    String? name = await storage.read(key: _userNameKey);
    return LogInDto((builder) {
      builder.name = name ?? '';
      builder.email = email ?? '';
      builder.accessKey = '';
    });
  }
}
