part of 'dump_bloc.dart';

abstract class DumpState {}

class ReloadState implements DumpState {}

class LoadingState implements DumpState {}

class DoneState implements DumpState {}

class ContentState implements DumpState {
  final FullDumpDto dumpReport;

  ContentState({
    required this.dumpReport,
  });
}

class ErrorState implements DumpState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
