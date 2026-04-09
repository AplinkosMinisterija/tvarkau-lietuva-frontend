part of 'analytics_bloc.dart';

abstract class AnalyticsState {}

class ReloadState implements AnalyticsState {}

class LoadingState implements AnalyticsState {}

class ContentState implements AnalyticsState {
  final ReportCategoryAnalyticsDto? analytics;

  ContentState({
    this.analytics,
  });
}

class ErrorState implements AnalyticsState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
