part of 'home_bloc.dart';

abstract class HomeState {}

class LoadingState implements HomeState {}

class ContentState implements HomeState {
  final List<PublicReportDto> trashReports;
  final List<DumpDto> dumpReports;
  final ReportStatisticsDto reportStatistics;

  ContentState({
    required this.trashReports,
    required this.dumpReports,
    required this.reportStatistics,
  });
}

class ErrorState implements HomeState {
  final String errorMessage;
  final String type;

  ErrorState({
    required this.errorMessage,
    required this.type,
  });
}
