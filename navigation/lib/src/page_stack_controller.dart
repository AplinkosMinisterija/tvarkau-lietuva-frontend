import 'dart:async';

import 'package:flutter/material.dart';

import 'exception/navigation_exception.dart';
import 'page_completer.dart';

mixin PageStackController on ChangeNotifier {
  final List<Page<dynamic>> _pages = <Page<dynamic>>[];

  List<Page<dynamic>> get pages => List<Page<dynamic>>.unmodifiable(_pages);

  final List<PageCompleter<dynamic>> _pageCompleters =
      <PageCompleter<dynamic>>[];

  void push(Page<dynamic> page) {
    _pages.add(page);
    notifyListeners();
  }

  Future<T> pushForResult<T>(Page<dynamic> page) {
    _pageCompleters.add(PageCompleter<T>(pageId: page.hashCode));
    push(page);
    return _pageCompleters.last.completer.future as Future<T>;
  }

  void completeLastWithResult(dynamic result) {
    _pageCompleters.last.completer.complete(result);
  }

  void popWithResult(dynamic result) {
    if (!_pageCompleters.last.completer.isCompleted) {
      _pageCompleters.last.completer.complete(result);
    }
    _pageCompleters.removeLast();
    pop();
  }

  void onPopResultDispatch() {
    if (_pageCompleters.isNotEmpty &&
        !_pageCompleters.last.completer.isCompleted) {
      _pageCompleters.last.completer.complete(null);
    }
  }

  void pushAll(List<Page<dynamic>> pages) {
    _pages.addAll(pages);
    notifyListeners();
  }

  void remove(Page<dynamic> page) {
    _pages.remove(page);
    notifyListeners();
  }

  void replace(Page<dynamic> page) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
      push(page);
    } else {
      push(page);
    }
  }

  void replaceLastWith(List<Page<dynamic>> pages) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
      pushAll(pages);
    } else {
      pushAll(pages);
    }
  }

  void resetTo(Page<dynamic> page) {
    _pages
      ..clear()
      ..add(page);
    notifyListeners();
  }

  void popUntil(String pageName) {
    final int index = _pages.indexWhere((Page<dynamic> page) {
      return page.name == pageName;
    });
    switch (index) {
      case -1:
        throw NavigationException(
          message: 'PageName $pageName '
              'is not found on the stack of $runtimeType',
        );
    }
    _pages.removeRange(index + 1, _pages.length);
    notifyListeners();
  }

  void popUntilPage(Page<dynamic> untilPage) {
    final int index = _pages.indexWhere((Page<dynamic> page) {
      return page.name == untilPage.name;
    });
    switch (index) {
      case -1:
        throw NavigationException(
          message: 'PageName ${untilPage.name} '
              'is not found on the stack of $runtimeType',
        );
    }
    _pages.removeRange(index + 1, _pages.length);
    notifyListeners();
  }

  void pop() {
    _pages.removeLast();
    notifyListeners();
  }

  void resetToFirst() {
    _pages.removeRange(1, _pages.length);
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
