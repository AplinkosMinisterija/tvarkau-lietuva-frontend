part of 'admin_bloc.dart';

abstract class AdminEvent {}

class LoadData implements AdminEvent {}

class LogIn implements AdminEvent {}

class LogOut implements AdminEvent {}

class OnViewReports implements AdminEvent {
  final String category;

  OnViewReports({
    required this.category,
  });
}

class OnViewDumps implements AdminEvent {}

class OnViewDeleted implements AdminEvent {
  final String category;

  OnViewDeleted({
    required this.category,
  });
}

class ReviewReport implements AdminEvent {
  final String refId;

  ReviewReport({
    required this.refId,
  });
}

class ReviewDump implements AdminEvent {
  final String refId;

  ReviewDump({
    required this.refId,
  });
}

class ReloadPage implements AdminEvent {}
