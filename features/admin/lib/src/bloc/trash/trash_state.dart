part of 'trash_bloc.dart';

abstract class TrashState {}

class ReloadState implements TrashState {}

class LoadingState implements TrashState {}

class ContentState implements TrashState {
  final FullReportDto trashReport;

  ContentState({
    required this.trashReport,
  });
}

class ErrorState implements TrashState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
