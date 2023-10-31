import 'package:core_ui/core_ui.dart';
import 'package:dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:admin/admin_screen.dart';
import 'package:dashboard/src/report_information/ui/information_screen.dart';
import 'package:dashboard/src/adding_report/ui/adding_screen.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

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
