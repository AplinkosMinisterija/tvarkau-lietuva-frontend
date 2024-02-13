part of 'admin_bloc.dart';

sealed class AdminState {}

class LoadingState implements AdminState {}

class LogingState implements AdminState {}

class ReportState implements AdminState {
  final LogInDto userInfo;
  final List<FullReportDto> reports;
  final String category;

  ReportState({
    required this.reports,
    required this.userInfo,
    required this.category,
  });
}

class DumpState implements AdminState {
  final LogInDto userInfo;
  final List<FullDumpDto> dumps;

  DumpState({
    required this.dumps,
    required this.userInfo,
  });
}

class DeletedState implements AdminState {
  final LogInDto userInfo;
  final List<FullReportDto> reports;
  final String category;

  DeletedState({
    required this.reports,
    required this.userInfo,
    required this.category,
  });
}

class ErrorState implements AdminState {
  final String errorMessage;
  final String errorDescription;

  ErrorState({
    required this.errorDescription,
    required this.errorMessage,
  });
}
