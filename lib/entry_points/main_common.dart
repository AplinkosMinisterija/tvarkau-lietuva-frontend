import 'dart:math';
import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tvarkau_lietuva/app/aad_app.dart';
import '../app/app_config.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:admin/src/auth/helpers/globals.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> mainCommon(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  appDI.initDependencies(flavor);
  await dataDI.initDependencies(flavor);
  setPathUrlStrategy();

  if (Uri.base.toString().contains("access_token=")) {
    var idxStart =
        Uri.base.toString().indexOf("access_token=") + "access_token=".length;
    var idxEnd = min(Uri.base.toString().length - 1,
        Uri.base.toString().indexOf("&token_type="));
    var accessToken = Uri.base.toString().substring(idxStart, idxEnd);
    Globals.instance.azureAccessToken = accessToken;
  }

  if (kReleaseMode) {
    // Only enable Sentry in release builds.
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://a2b91fc626e0481e8e690e57d537bcd5@sentry.biip.lt/37';
        options.tracesSampleRate = 1.0;
      },
      appRunner: () => runApp(AadApp()),
    );
  } else {
    runApp(AadApp());
  }
}
