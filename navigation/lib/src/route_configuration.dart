import 'package:flutter/material.dart';
import 'package:navigation/src/page_with_scaffold_key.dart';

class RouteConfiguration {
  final Page<dynamic> page;

  RouteConfiguration({
    required this.page,
  });

  GlobalKey<ScaffoldMessengerState>? get scaffoldKey {
    if (page is PageWithScaffoldKey) {
      return (page as PageWithScaffoldKey<dynamic>).scaffoldKey;
    } else {
      return null;
    }
  }

  @override
  String toString() {
    return 'RouteConfiguration for ${page.name}';
  }
}
