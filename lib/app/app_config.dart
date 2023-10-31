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
        baseUrl = HttpApiConstants.devBaseUrl;
        break;
      case Flavor.staging:
        baseUrl = HttpApiConstants.stageBaseUrl;
        break;
      case Flavor.production:
        baseUrl = HttpApiConstants.prodBaseUrl;
        break;
    }

    return AppConfig(flavor, baseUrl);
  }
}
