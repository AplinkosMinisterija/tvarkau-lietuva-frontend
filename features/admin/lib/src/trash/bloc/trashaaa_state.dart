part of 'trashaaa_bloc.dart';

abstract class TrashStateaaa {}

class ReloadState implements TrashStateaaa {}

class LoadingState implements TrashStateaaa {}

class ContentState implements TrashStateaaa {
  final List<FullReportDto> trashReports;

  ContentState({
    required this.trashReports,
  });
}

class ErrorState implements TrashStateaaa {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
