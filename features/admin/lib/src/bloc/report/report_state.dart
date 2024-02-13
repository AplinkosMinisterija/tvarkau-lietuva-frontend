part of 'report_bloc.dart';

abstract class ReportState {}

class ReloadState implements ReportState {}

class LoadingState implements ReportState {}

class ContentState implements ReportState {
  final FullReportDto trashReport;

  ContentState({
    required this.trashReport,
  });
}

class ErrorState implements ReportState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
