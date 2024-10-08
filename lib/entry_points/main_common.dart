import 'dart:math';
import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:tvarkau_lietuva/app/aad_app.dart';
import '../app/app_config.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:admin/admin.dart';

Future<void> mainCommon(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SecureStorageProvider().resetUserCache();
  usePathUrlStrategy();

  if (Uri.base.toString().contains("access_token=")) {
    var idxStart =
        Uri.base.toString().indexOf("access_token=") + "access_token=".length;
    var idxEnd = min(Uri.base.toString().length - 1,
        Uri.base.toString().indexOf("&token_type="));
    var accessToken = Uri.base.toString().substring(idxStart, idxEnd);
    Globals.instance.azureAccessToken = accessToken;
  }

  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://a5fa926d775d54e54d0be1403ede3953@sentry.biip.lt/49';
        options.tracesSampleRate = 1.0;
        options.diagnosticLevel = SentryLevel.debug;
        options.enableNativeCrashHandling = true;
        options.reportSilentFlutterErrors = true;
        options.enableAutoNativeBreadcrumbs = true;
        options.markAutomaticallyCollectedErrorsAsFatal = true;
        options.attachStacktrace = true;
      },
      appRunner: () => runApp(
        DefaultAssetBundle(
          bundle: SentryAssetBundle(),
          child: AadApp(),
        ),
      ),
    );
  } else {
    runApp(AadApp());
  }
}
