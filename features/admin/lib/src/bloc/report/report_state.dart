part of 'report_bloc.dart';

abstract class ReportState {}

class ReloadState implements ReportState {}

class LoadingState implements ReportState {}

class ContentState implements ReportState {
  final FullReportDto trashReport;
  final Permit? permits;

  ContentState({
    required this.trashReport,
    this.permits,
  });
}

class ErrorState implements ReportState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
