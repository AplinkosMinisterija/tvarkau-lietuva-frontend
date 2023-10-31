import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageProvider {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  static const String _keyJwtKey = 'jwt_key';

  setJwtToken(String jwtToken) async {
    await storage.write(
      key: _keyJwtKey,
      value: jwtToken,
    );
  }

  Future<String> getJwtToken() async {
    String token = await storage.read(key: _keyJwtKey) ?? 'No data found';
    return token;
  }

  deleteJwtToken() async {
    await storage.delete(key: _keyJwtKey);
  }
}
