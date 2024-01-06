part of 'admin_bloc.dart';

abstract class AdminState {}

class LoadingState implements AdminState {}

class LogingState implements AdminState {}

class ReportState implements AdminState {
  final FullReportDto report;

  ReportState({
    required this.report,
  });
}

class DumpState implements AdminState {
  final FullDumpDto dump;

  DumpState({
    required this.dump,
  });
}

class ContentState implements AdminState {
  final LogInDto userInfo;
  final List<FullReportDto> reports;
  final List<FullDumpDto> dumps;

  ContentState({
    required this.userInfo,
    required this.reports,
    required this.dumps,
  });
}

class ErrorState implements AdminState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
