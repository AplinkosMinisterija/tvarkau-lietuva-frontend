import 'package:flutter/material.dart';

abstract class PageWithScaffoldKey<T> extends Page<T> {
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  PageWithScaffoldKey({LocalKey? key}) : super(key: key);
}
