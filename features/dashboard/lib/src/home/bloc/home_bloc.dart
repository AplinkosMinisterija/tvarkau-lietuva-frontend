import 'package:api_client/api_client.dart';
import 'package:core/core.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(LoadingState()) {
    on<LoadData>(_onLoadData);
    on<ReloadPage>(_onReloadEvent);
  }

  Future<void> _onLoadData(
    LoadData event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final responses = await Future.wait(
        [
          ApiProvider().getAllVisibleReports(event.type),
          ApiProvider().getAllVisibleDumpReports(),
          ApiProvider().getReportStatistics(event.type),
        ],
        eagerError: true,
      );
      emit(
        ContentState(
          trashReports: responses[0] as List<PublicReportDto>,
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

  Future<void> _onReloadEvent(
    ReloadPage _,
    Emitter<HomeState> emit,
  ) async {
    add(LoadData(type: _.type));
  }
}
