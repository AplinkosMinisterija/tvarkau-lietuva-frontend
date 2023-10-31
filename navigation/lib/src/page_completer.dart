import 'dart:async';

class PageCompleter<T> {
  final int pageId;
  final Completer<T> completer = Completer<T>();

  PageCompleter({required this.pageId});
}
