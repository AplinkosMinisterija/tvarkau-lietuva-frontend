part of 'home_bloc.dart';

abstract class HomeState {}

class LoadingState implements HomeState {}

class InitState implements HomeState {
  final List<PublicReportDto> reports;
  final ReportStatisticsDto reportStatistics;

  InitState({
    required this.reports,
    required this.reportStatistics,
  });
}

class TrashState implements HomeState {
  final List<PublicReportDto> reports;
  final List<DumpDto> dumpReports;
  final ReportStatisticsDto reportStatistics;

  TrashState({
    required this.reports,
    required this.dumpReports,
    required this.reportStatistics,
  });
}

class ForestState implements HomeState {
  final List<PublicReportDto> reports;
  final ReportStatisticsDto reportStatistics;

  ForestState({
    required this.reports,
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
