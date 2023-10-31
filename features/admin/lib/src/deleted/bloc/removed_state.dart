part of 'removed_bloc.dart';

abstract class RemovedState {}

class ReloadState implements RemovedState {}

class LoadingState implements RemovedState {}

class ContentState implements RemovedState {
  final List<ReportModel> trashReports;

  ContentState({
    required this.trashReports,
  });
}

class ErrorState implements RemovedState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
