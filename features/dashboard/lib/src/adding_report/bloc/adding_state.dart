part of 'adding_bloc.dart';

abstract class AddingState {}

class LoadingState implements AddingState {}

class TrashContentState implements AddingState {
  final List<PublicReportDto> trashReports;

  TrashContentState({
    required this.trashReports,
  });
}

class ForestContentState implements AddingState {
  final List<PublicReportDto> forestReports;

  ForestContentState({
    required this.forestReports,
  });
}

class BeetleInformationState implements AddingState {}

class BeetleContentState implements AddingState {}

class ConfirmationState implements AddingState {}

class ErrorState implements AddingState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
