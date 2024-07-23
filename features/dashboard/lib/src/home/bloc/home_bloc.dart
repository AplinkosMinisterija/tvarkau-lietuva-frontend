import 'package:api_client/api_client.dart';
import 'package:core/core.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(LoadingState()) {
    on<LoadData>(_onLoadData);
    on<LoadTrashData>(_onLoadTrashData);
    on<LoadPermitsData>(_onLoadPermitsData);
    on<LoadForestData>(_onLoadForestData);
    on<ReloadPage>(_onReloadEvent);
  }

  Future<void> _onLoadData(
    LoadData event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(LoadingState());
      final responses = await Future.wait(
        [
          ApiProvider().getAllVisibleReports(null),
          ApiProvider().getReportStatistics(null),
        ],
        eagerError: true,
      );
      emit(
        InitState(
          reports: responses[0] as List<PublicReportDto>,
          reportStatistics: responses[1] as ReportStatisticsDto,
        ),
      );
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Netikėta klaida', type: 'trash'),
      );
    }
  }

  Future<void> _onLoadTrashData(
    LoadTrashData _,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(LoadingState());
      final responses = await Future.wait(
        [
          ApiProvider().getAllVisibleReports('trash'),
          ApiProvider().getAllVisibleDumpReports(),
          ApiProvider().getReportStatistics('trash'),
        ],
        eagerError: true,
      );

      emit(
        TrashState(
          reports: responses[0] as List<PublicReportDto>,
          dumpReports: responses[1] as List<DumpDto>,
          reportStatistics: responses[2] as ReportStatisticsDto,
        ),
      );
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Netikėta klaida', type: 'trash'),
      );
    }
  }

  Future<void> _onLoadForestData(
    LoadForestData _,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(LoadingState());
      final responses = await Future.wait(
        [
          ApiProvider().getAllVisibleReports('forest'),
          ApiProvider().getReportStatistics('forest'),
        ],
        eagerError: true,
      );

      emit(
        ForestState(
          reports: responses[0] as List<PublicReportDto>,
          reportStatistics: responses[1] as ReportStatisticsDto,
        ),
      );
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Netikėta klaida', type: 'forest'),
      );
    }
  }

  Future<void> _onLoadPermitsData(
    LoadPermitsData _,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(LoadingState());
      final responses = await Future.wait(
        [
          ApiProvider().getAllVisibleReports('permits'),
          ApiProvider().getReportStatistics('permits'),
        ],
        eagerError: true,
      );

      emit(
        PermitsState(
          reports: responses[0] as List<PublicReportDto>,
          reportStatistics: responses[1] as ReportStatisticsDto,
        ),
      );
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Netikėta klaida', type: 'forest'),
      );
    }
  }

  Future<void> _onReloadEvent(
    ReloadPage _,
    Emitter<HomeState> emit,
  ) async {
    add(LoadData());
  }
}
