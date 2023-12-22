part of 'dump_bloc.dart';

abstract class DumpState {}

class ReloadState implements DumpState {}

class LoadingState implements DumpState {}

class ContentState implements DumpState {
  final List<FullDumpDto> dumpReports;

  ContentState({
    required this.dumpReports,
  });
}

class ErrorState implements DumpState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
