import 'package:dashboard/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../navigation.dart';

class AppRouterDelegate extends RouterDelegate<RouteConfiguration>
    with
        // ignore: prefer_mixin
        ChangeNotifier,
        PageStackController,
        PopNavigatorRouterDelegateMixin<RouteConfiguration> {
  final AppMessageNotifier messageNotifier;
  final PopNavigationObserver popNavigationObserver;

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  AppRouterDelegate({
    required this.messageNotifier,
    required this.popNavigationObserver,
  });

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  RouteConfiguration? get currentConfiguration =>
      pages.isNotEmpty ? RouteConfiguration(page: pages.last) : null;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      onPopPage: onPopPage,
      pages: pages,
      observers: <NavigatorObserver>[
        messageNotifier,
        popNavigationObserver,
      ],
    );
  }

  @override
  Future<void> setNewRoutePath(RouteConfiguration configuration) {
    resetTo(configuration.page);
    return SynchronousFuture<void>(null);
  }

  @override
  void notifyListeners() {
    messageNotifier.updateScaffoldKey();
    super.notifyListeners();
  }

  bool onPopPage(Route<dynamic> route, dynamic result) {
    onPopResultDispatch();
    final bool didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    pop();
    return true;
  }

  void pushNamed(String routeLocation) {
    push(RoutePageGenerator.generateRoute(routeLocation));
  }

  void pushNamedWithFixedPop(int popCount, Page<dynamic> page) {
    for (int i = 0; i < popCount; i++) {
      pop();
    }
    push(page);
  }

  void popWithFixedCount(int popCount) {
    for (int i = 0; i < popCount; i++) {
      pop();
    }
  }
}

extension AppRouter on Type {
  static AppRouterDelegate of(BuildContext context) {
    return Router.of(context).routerDelegate as AppRouterDelegate;
  }
}
