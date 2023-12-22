import 'package:core/core.dart';

enum Flavor {
  dev,
  staging,
  production,
}

class AppConfig {
  final Flavor flavor;
  final String baseUrl;

  AppConfig(
    this.flavor,
    this.baseUrl,
  );

  factory AppConfig.fromFlavor(Flavor flavor) {
    String baseUrl;
    switch (flavor) {
      case Flavor.dev:
        baseUrl = GlobalConstants.basePath;
        break;
      case Flavor.staging:
        baseUrl = GlobalConstants.basePath;
        break;
      case Flavor.production:
        baseUrl = GlobalConstants.basePath;
        break;
    }

    return AppConfig(flavor, baseUrl);
  }
}
