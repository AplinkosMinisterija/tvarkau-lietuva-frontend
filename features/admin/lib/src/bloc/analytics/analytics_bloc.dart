import 'package:api_client/api_client.dart';
import 'package:core/core.dart';

part 'analytics_event.dart';
part 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  AnalyticsBloc() : super(LoadingState()) {
    on<LoadData>(_onLoadData);
    on<UpdateAnalyticsData>(_onUpdateAnalyticsData);
    on<ReloadPage>(_onReloadEvent);
    add(LoadData());
  }

  Future<void> _onLoadData(
    LoadData event,
    Emitter<AnalyticsState> emit,
  ) async {
    try {
      emit(
        ContentState(
          analytics: null,
        ),
      );
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Something went wrong'),
      );
    }
  }

  Future<void> _onUpdateAnalyticsData(
    UpdateAnalyticsData event,
    Emitter<AnalyticsState> emit,
  ) async {
    try {
      emit(
        LoadingState(),
      );

      final ReportCategoryAnalyticsDto analytics =
          await ApiProvider().getReportCategoryAnalytics(
        event.dateFrom,
        event.dateTo,
        event.category,
        event.status,
      );

      emit(
        ContentState(
          analytics: analytics,
        ),
      );
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Įvyko netikėta klaida'),
      );
    }
  }

  Future<void> _onReloadEvent(
    ReloadPage _,
    Emitter<AnalyticsState> emit,
  ) async {
    add(LoadData());
  }
}
