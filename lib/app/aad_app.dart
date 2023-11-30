// Openapi Generator last run: : 2023-11-29T15:00:13.065181
import 'package:core_ui/core_ui.dart';
import 'package:dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:admin/admin_screen.dart';
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:dashboard/dashboard.dart';

@Openapi(
  additionalProperties: DioProperties(
    pubName: 'api_client',
    pubAuthor: 'Aplinkos apsaugos departamentas',
  ),
  inputSpecFile: 'openapi.yaml',
  generatorName: Generator.dio,
  useNextGen: true,
  outputDirectory: 'api_client',
)
class AadApp extends StatelessWidget {
  AadApp({
    Key? key,
  }) : super(key: key);

  final _router = GoRouter(
    initialLocation: '/',
    observers: [SentryNavigatorObserver()],
    errorBuilder: (context, state) => RouteErrorScreen(
      errorText: state.matchedLocation,
      onPressed: () {
        context.goNamed("home");
      },
    ),
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        name: 'admin',
        path: '/admin',
        builder: (context, state) => const AdminScreen(),
      ),
      GoRoute(
        name: 'report',
        path: '/pranesimas',
        builder: (context, state) =>
            InformationScreen(reportId: state.uri.queryParameters['id'] ?? '1'),
      ),
      GoRoute(
          name: 'newReport',
          path: '/pranesti',
          builder: (context, state) => const AddingScreen()),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      color: const Color.fromRGBO(57, 97, 84, 1),
      locale: const Locale('lt'),
      theme: ThemeData.light()
          .copyWith(primaryColor: const Color.fromRGBO(57, 97, 84, 1)),
    );
  }
}