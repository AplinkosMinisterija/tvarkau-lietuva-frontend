part of 'admin_bloc.dart';

sealed class AdminState {}

class LoadingState implements AdminState {}

class LogingState implements AdminState {}

class ReportState implements AdminState {
  final LogInDto userInfo;
  final List<FullReportDto> reports;

  ReportState({
    required this.reports,
    required this.userInfo,
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

  DeletedState({
    required this.reports,
    required this.userInfo,
  });
}
//
// class ContentState implements AdminState {
//   final LogInDto userInfo;
//   final List<FullReportDto> reports;
//   final List<FullDumpDto> dumps;
//
//   ContentState({
//     required this.userInfo,
//     required this.reports,
//     required this.dumps,
//   });
// }

class ErrorState implements AdminState {
  final String errorMessage;
  final String errorDescription;

  ErrorState({
    required this.errorDescription,
    required this.errorMessage,
  });
}
