part of 'home_bloc.dart';

abstract class HomeState {}

class LoadingState implements HomeState {}

class ContentState implements HomeState {
  final List<ReportModel> trashReports;
  final List<DumpDto> dumpReports;

  ContentState({
    required this.trashReports,
    required this.dumpReports,
  });
}

class ErrorState implements HomeState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}

class AddingState implements HomeState {
  final List<ReportModel> trashReports;
  final double width;
  final double height;

  AddingState({
    required this.trashReports,
    required this.width,
    required this.height,
  });
}
