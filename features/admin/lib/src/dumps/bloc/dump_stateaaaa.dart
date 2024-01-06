part of 'dump_blocaaaa.dart';

abstract class DumpStateaaa {}

class ReloadState implements DumpStateaaa {}

class LoadingState implements DumpStateaaa {}

class ContentState implements DumpStateaaa {
  final List<FullDumpDto> dumpReports;

  ContentState({
    required this.dumpReports,
  });
}

class ErrorState implements DumpStateaaa {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
