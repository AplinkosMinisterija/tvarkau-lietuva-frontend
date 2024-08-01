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
  final ReportStatisticsDto reportStatistics;
  final CameraPosition cameraPosition;

  TrashState({
    required this.reports,
    required this.reportStatistics,
    required this.cameraPosition,
  });
}

class DumpsState implements HomeState {
  final List<DumpDto> dumpReports;
  final CameraPosition cameraPosition;

  DumpsState({
    required this.dumpReports,
    required this.cameraPosition,
  });
}

class ForestState implements HomeState {
  final List<PublicReportDto> reports;
  final ReportStatisticsDto reportStatistics;
  final CameraPosition cameraPosition;

  ForestState({
    required this.reports,
    required this.reportStatistics,
    required this.cameraPosition,
  });
}

class PermitsState implements HomeState {
  final List<PublicReportDto> reports;
  final ReportStatisticsDto reportStatistics;
  final CameraPosition cameraPosition;

  PermitsState({
    required this.reports,
    required this.reportStatistics,
    required this.cameraPosition,
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
