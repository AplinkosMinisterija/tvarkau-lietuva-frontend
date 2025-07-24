part of 'information_bloc.dart';

abstract class InformationState {}

class LoadingState implements InformationState {}

class ContentState implements InformationState {
  final PublicReportDto trashReport;

  ContentState({
    required this.trashReport,
  });
}

class ErrorState implements InformationState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}

class NotFoundState implements InformationState {
  final String errorMessage;
  final String descriptionMessage;

  NotFoundState({
    required this.errorMessage,
    required this.descriptionMessage,
  });
}
