import 'dart:core';

class NavigationException implements Exception {
  const NavigationException({required this.message});

  final String message;

  @override
  String toString() => 'NavigationException: $message';
}
