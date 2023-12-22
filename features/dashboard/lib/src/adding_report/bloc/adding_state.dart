part of 'adding_bloc.dart';

abstract class AddingState {}

class LoadingState implements AddingState {}

class ContentState implements AddingState {
  final List<PublicReportDto> trashReports;

  ContentState({
    required this.trashReports,
  });
}

class ConfirmationState implements AddingState {}

class ErrorState implements AddingState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
