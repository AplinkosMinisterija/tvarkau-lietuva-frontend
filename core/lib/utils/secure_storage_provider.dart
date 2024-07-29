import 'package:api_client/api_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageProvider {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  static const String _keyJwtKey = 'jwt_key';
  static const String _userEmailKey = 'user_email_key';
  static const String _userNameKey = 'user_name_key';
  static const String _tenantKey = 'tenant_key';
  static const String _activeCategory = 'active_category';
  static const String _activeMapLat = 'active_map_lat';
  static const String _activeMapLong = 'active_map_long';
  static const String _activeMapZoom = 'active_map_zoom';
  static const String _scrollOffset = 'scroll_offset';

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

  setTenant(String tenant) async {
    await storage.write(
      key: _tenantKey,
      value: tenant,
    );
  }

  Future<String?> getTenant() {
    return storage.read(key: _tenantKey);
  }

  deleteTenant() async {
    await storage.delete(
      key: _tenantKey,
    );
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

  setActiveCategory(String category) async {
    await storage.write(
      key: _activeCategory,
      value: category,
    );
  }

  Future<String?> getActiveCategory() {
    return storage.read(key: _activeCategory);
  }

  deleteActiveCategory() async {
    await storage.delete(
      key: _activeCategory,
    );
  }
  //
  // setCameraSetup(CameraPosition activeMapSetup) async {
  //   await storage.write(
  //     key: _activeMapLat,
  //     value: activeMapSetup.target.latitude.toString(),
  //   );
  //   await storage.write(
  //     key: _activeMapLong,
  //     value: activeMapSetup.target.longitude.toString(),
  //   );
  //   await storage.write(
  //     key: _activeMapZoom,
  //     value: activeMapSetup.zoom.toString(),
  //   );
  // }
  //
  // Future<CameraPosition?> getCameraSetup() async {
  //   String? lat = await storage.read(key: _activeMapLat);
  //   String? long = await storage.read(key: _activeMapLong);
  //   String? zoom = await storage.read(key: _activeMapZoom);
  //
  //   if (lat != null && long != null && zoom != null) {
  //     return CameraPosition(
  //         target: LatLng(double.parse(lat), double.parse(long)),
  //         zoom: double.parse(zoom));
  //   } else {
  //     return null;
  //   }
  // }
  //
  // deleteCameraSetup() async {
  //   await storage.delete(
  //     key: _activeMapLat,
  //   );
  //   await storage.delete(
  //     key: _activeMapLong,
  //   );
  //   await storage.delete(
  //     key: _activeMapZoom,
  //   );
  // }
  //
  // setScrollOffset(double offset) async {
  //   await storage.write(
  //     key: _scrollOffset,
  //     value: offset.toString(),
  //   );
  // }
  //
  // Future<double> getScrollOffset() async {
  //   String? offsetString = await storage.read(key: _scrollOffset);
  //
  //   if (offsetString != null) {
  //     return double.parse(offsetString);
  //   } else {
  //     return 0;
  //   }
  // }
  //
  // deleteScrollOffset() async {
  //   await storage.delete(
  //     key: _scrollOffset,
  //   );
  // }
  //
  // resetUserCache() async {
  //   await deleteActiveCategory();
  //   await deleteCameraSetup();
  //   await deleteScrollOffset();
  // }
}
