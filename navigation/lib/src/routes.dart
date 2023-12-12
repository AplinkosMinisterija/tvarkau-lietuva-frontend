import 'package:flutter/material.dart';

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
