import 'package:flutter/material.dart';
import 'package:dashboard/dashboard_screen.dart';

class RoutePageGenerator {
  static Page<dynamic> generateRoute(String routeName) {
    switch (routeName) {
      case Routes.homeLocation:
      //return HomeFeature.page();
      default:
        throw Exception();
    }
  }
}

class Routes {
  static const String homeLocation = '/home';
}
