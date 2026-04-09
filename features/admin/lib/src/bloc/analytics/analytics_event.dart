part of 'analytics_bloc.dart';

abstract class AnalyticsEvent {}

class LoadData implements AnalyticsEvent {}

class ReloadPage implements AnalyticsEvent {}

class UpdateAnalyticsData implements AnalyticsEvent {
  final String dateFrom;
  final String dateTo;
  final String? status;
  final String? category;

  UpdateAnalyticsData({
    required this.dateFrom,
    required this.dateTo,
    this.status,
    this.category,
  });
}
